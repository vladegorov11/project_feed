require "rails_helper"

describe FeedsController do

  describe 'my_feeds action' do
      subject { get :my_feeds }

      it { should redirect_to new_user_session_path }
      context 'for signed in user' do
        let(:user) { FactoryBot.create(:user, :admin) }
        before do
         sign_in(user)
        end
        it { expect(subject).to render_template(:my_feeds) }
      end
    end
  describe 'show action' do
    subject { get :show, id: 0 }
      it "render show template if an feed is not found" do
        response.status.should == 404
      end

  end
end
