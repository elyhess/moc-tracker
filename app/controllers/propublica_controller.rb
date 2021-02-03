class PropublicaController < ApplicationController
	before_action :get_members, only: [:search]

	def search
		member_search = params[:search]
		found_member = @members.find {|m| m[:last_name] == member_search}
		cookies[found_member[:last_name]] = found_member[:phone_number]
		flash[:notice] = "Senator #{found_member[:last_name]} found!"
		redirect_to root_path
	end

	private

	def get_members
		conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
			faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_KEY"]
		end
		response = conn.get("/congress/v1/116/senate/members.json")
		json = JSON.parse(response.body, symbolize_names: true)
		@members = json[:results][0][:members]
	end
end