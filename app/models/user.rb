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
#  username                        :string(255)
#  house_id                        :integer
#  solar                           :decimal(12, 4)   default(0.0)
#  melange                         :decimal(12, 4)   default(0.0)
#  exp                             :decimal(12, 4)   default(0.0)
#  admin                           :boolean          default(FALSE)
#  leader                          :boolean          default(FALSE)
#  emperor                         :boolean          default(FALSE)
#  arrakis                         :boolean          default(FALSE)
#  regent                          :boolean          default(FALSE)
#  vezir                           :boolean          default(FALSE)
#  court                           :boolean          default(FALSE)
#  mentat                          :boolean          default(FALSE)
#  army_mentat                     :boolean          default(FALSE)
#  diplomat                        :boolean          default(FALSE)
#  senator                         :boolean          default(FALSE)
#  chairman                        :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  belongs_to :house

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.get_current_users
    config = sorcery_config

    where("#{config.last_activity_at_attribute_name} IS NOT NULL")
    .where("#{config.last_logout_at_attribute_name} IS NULL OR #{config.last_activity_at_attribute_name} > #{config.last_logout_at_attribute_name}")
    .where("#{config.last_activity_at_attribute_name} > ? ", config.activity_timeout.seconds.ago.utc.to_s(:db))
  end

end
