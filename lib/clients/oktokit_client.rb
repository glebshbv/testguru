class OktokitClient

  def initialize
    @client = new_oktokit_client
  end

  def create_gist(params)
    @client.create_gist(params)
  end

  private

  def new_oktokit_client
    Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
  end

end
