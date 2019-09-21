# Controller para gerenciamento de usuários na API
module V1
  class UsersController < ApiController
    def upload_avatar
      current_user.avatar.attach(io: image_io, filename: image_name)

      unless current_user.save
        puts current_user.errors.inspect
        render json: { error: "Unable to create post" }, status: 422
      end
    end

    private

    def image_io
      decoded_image = Base64.decode64(params[:avatar][:image])
      StringIO.new(decoded_image)
    end

    def image_name
      params[:avatar][:file_name]
    end
  end
end
