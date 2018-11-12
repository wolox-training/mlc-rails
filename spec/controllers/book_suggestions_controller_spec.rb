require 'rails_helper'

describe BookSuggestionsController do
  describe 'POST #create' do
    context('when user is authenticated') do
      include_context 'Authenticated User'
      context 'and creating a valid book suggestion' do
        let!(:book_suggestion_attributes) { attributes_for(:book_suggestion, user: user) }
        # it 'creates a new book suggestion' do
        #   expect do
        #     post :create, params: { id: user.id, book_suggestion: book_suggestion_attributes }
        #   end.to change(BookSuggestion, :count).by(1)
        # end

        # it 'responds with OK status' do
        #   post :create, params: { id: user.id, book_suggestion: book_suggestion_attributes }
        #   expect(response).to have_http_status(:created)
        # end

        it 'sets user id value' do
          post :create, params: { id: user.id, book_suggestion: book_suggestion_attributes }
          expect(response_body['user_id']) =~ user.id
        end
      end

      context 'and creating an invalid book suggestion' do
        let!(:book_suggestion_attributes) { attributes_for(:book_suggestion, user: user) }
        before do
          post :create, params: { id: user.id, book_suggestion: book_suggestion_attributes }
        end

        # it 'doesn\'t create a new book suggestion' do
        #   expect do
        #     post :create, params: { id: user.id, book_suggestion: book_suggestion_attributes }
        #   end.to change(BookSuggestion, :count).by(0)
        # end

        # it 'returns error messages' do
        #   expect(response_body['error']).to be_present
        # end

        it 'responds with error status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when user is not authenticated' do
      context 'and creating a valid book suggestion' do
        let!(:book_suggestion_attributes) { attributes_for(:book_suggestion) }
        # it 'creates a new book suggestion' do
        #   expect do
        #     post :create, params: { book_suggestion: book_suggestion_attributes }
        #   end.to change(BookSuggestion, :count).by(1)
        # end

        # it 'responds with OK status' do
        #   post :create, params: { id: user.id, book_suggestion: book_suggestion_attributes }
        #   expect(response).to have_http_status(:created)
        # end

        it 'sets user id to nil' do
          post :create, params: { book_suggestion: book_suggestion_attributes }
          expect(response_body['user_id']) =~ nil
        end
      end

      context 'and creating an invalid book suggestion' do
        let!(:book_suggestion_attributes) { attributes_for(:book_suggestion) }
        before do
          post :create, params: { book_suggestion: book_suggestion_attributes }
        end

        # it 'doesn\'t create a new book suggestion' do
        #   expect do
        #     post :create, params: { book_suggestion: nil }
        #   end.to change(BookSuggestion, :count).by(0)
        # end

        # it 'returns error messages' do
        #   expect(response_body['error']).to be_present
        # end

        it 'responds with error status' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
