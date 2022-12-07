class ApplicationController < ActionController::API
  def encode_token(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, 'secret')
  end

  def decode_token
    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(' ').last
      begin
        JWT.decode(token, 'secret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authorized_user
    decoded_token = decode_token()
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def authentication
    render json: { message: 'Credenciais inválidas' }, status: :unauthorized unless authorized_user
  end
end
