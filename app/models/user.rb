class User < ApplicationRecord

  def generate_and_save_token
    update(token: SecureRandom.hex(32))
    token
  end

  def revoke_token
    update(token: nil)
  end
end
