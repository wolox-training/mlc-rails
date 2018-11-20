require 'rails_helper'

describe BookSuggestionsController do
  describe 'POST #create' do
    context('when user is authenticated') do
      # include_context 'Authenticated User'
      subject(:user) { create(:user) }

      context 'and creating a valid book suggestion' do
        subject(:book_s) { build(:book_suggestion, user: user) }
        let(:http_request) { post :create, params: { book_suggestion: book_s.attributes } }

        it 'creates a new book suggestion' do
          expect { http_request }.to change { BookSuggestion.count }.by(1)
        end

        it 'responds with OK status' do
          http_request
          expect(response).to have_http_status(:created)
        end

        it 'sets user id value' do
          http_request
          expect(response_body['user_id']).to eql(user.id)
        end
      end

      context 'and creating an invalid book suggestion' do
        subject(:book_s) { build(:book_suggestion, user: nil) }
        let(:http_request) { post :create, params: { book_suggestion: book_s.attributes } }

        it 'doesn\'t create a new book suggestion' do
          expect { http_request }.to change { BookSuggestion.count }.by(0)
        end

        it 'responds with error status' do
          http_request
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when user is not authenticated' do
      context 'and creating a valid book suggestion' do
        subject(:book_s) { build(:book_suggestion) }
        let(:http_request) { post :create, params: { book_suggestion: book_s.attributes } }

        it 'creates a new book suggestion' do
          expect { http_request }.to change { BookSuggestion.count }.by(1)
        end

        it 'responds with OK status' do
          http_request
          expect(response).to have_http_status(:created)
        end

        # it 'sets user id to nil' do
        #   http_request
        #   expect(response_body['user_id']).to be_nil
        # end
      end

      context 'and creating an invalid book suggestion' do
        subject(:book_s) { build(:book_suggestion, user: nil) }
        let(:http_request) { post :create, params: { book_suggestion: book_s.attributes } }

        it 'doesn\'t create a new book suggestion' do
          expect { http_request }.to change { BookSuggestion.count }.by(0)
        end

        it 'responds with error status' do
          http_request
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
