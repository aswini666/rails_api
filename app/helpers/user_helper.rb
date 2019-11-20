module UserHelper
  def sorting
    if params[:sort]
      if params[:sort] == "email"
        users = User.order("email")
      end
      if params[:sort] == "name"
        users = User.order("name")
      end
      if params[:sort] == "city"
        users = User.order("city")
      end 
      render json: {status: "SUCCESS", message: "Sorted Users", data: users}, status: :ok 
    else
      render json: {status: "ERROR", message: "sorting is not valid", data: user.errors}, status: :unprocessable_entity
    end       
  end
end