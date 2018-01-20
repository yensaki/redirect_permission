module RedirectPermission
  class Url
    OPTION_ELEMENTS = %i(userinfo port opaque)

    def initialize(url:, hosts:, default:, use: [])
      @uri = URI(url)
      @hosts = hosts
      @default = URI(default)
      @use_elements = use
    end

    def permitted
      permitted = @uri.to_s if @hosts.include?(@uri.host)
      permitted = absolute_from_relative if relative?
      permitted || @default.to_s
    end

    private

    def absolute_from_relative
      uri = URI::Generic.build(scheme: @default.scheme, host: @default.host)
      (OPTION_ELEMENTS & @use_elements).each do |ele|
        uri.public_send("#{ele}=", @default.public_send(ele))
      end
      %i(path query fragment).each do |ele|
        uri.public_send("#{ele}=", @uri.public_send(ele))
      end
      uri.to_s
    rescue URI::InvalidComponentError
      nil
    end

    def relative?
      return false unless @uri.host.to_s.empty?
      %i(path query fragment).any? { |ele| !@uri.public_send(ele).to_s.empty? }
    end
  end
end
