# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string(255)      not null
#  crypted_password                :string(255)      not null
#  salt                            :string(255)      not null
#  created_at                      :datetime
#  updated_at                      :datetime
#  activation_state                :string(255)
#  activation_token                :string(255)
#  activation_token_expires_at     :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  failed_logins_count             :integer          default(0)
#  lock_expires_at                 :datetime
#  unlock_token                    :string(255)
#  last_login_at                   :datetime
#  last_logout_at                  :datetime
#  last_activity_at                :datetime
#  last_login_from_ip_address      :string(255)
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
