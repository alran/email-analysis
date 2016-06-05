class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable

  has_many :identities
  has_many :emails
  belongs_to :company

  before_save :set_user_category
  before_save :set_user_company
  before_save :set_user_name

  def google_oauth2
    identities.where( :provider => "google_oauth2" ).first
  end

  def google_oauth2_client
    if !@google_oauth2_client
      @google_oauth2_client = Google::APIClient.new(:application_name => 'HappySeed App', :application_version => "1.0.0" )
      @google_oauth2_client.authorization.update_token!({:access_token => google_oauth2.accesstoken, :refresh_token => google_oauth2.refreshtoken})
    end
    @google_oauth2_client
  end

  private

  def set_user_category
     self.category ||= "employee"
  end

  def set_user_name
     self.name ||= "Alyssa Ransbury"
  end

  def set_user_company
     self.company_id ||= Company.first.id
  end

end
