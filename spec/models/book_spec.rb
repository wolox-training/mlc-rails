require 'rails_helper'

describe Book do
  # before { create(:book) }
  # subject(:book) { build(:book) }

  subject(:book) do
    Book.new(
      genre: genre, author: author, cover_image: cover_image, title: title,
      publisher: publisher, year: year
    )
  end

  let(:genre)           { Faker::Book.genre }
  let(:author)          { Faker::Book.author }
  let(:cover_image)     { 'image.jpg' }
  let(:title)           { Faker::Book.title }
  let(:publisher)       { Faker::Book.publisher }
  let(:year)            { Faker::Date.backward(25) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:cover_image) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:publisher) }
  it { is_expected.to validate_presence_of(:year) }

  describe '#create' do
    context 'When the genre is nil' do
      let(:genre) { nil }

      it { is_expected.to be_invalid }
    end

    context 'When the author is nil' do
      let(:author) { nil }

      it { is_expected.to be_invalid }
    end

    context 'When the cover image is nil' do
      let(:cover_image) { nil }

      it { is_expected.to be_invalid }
    end

    context 'When the title is nil' do
      let(:title) { nil }

      it { is_expected.to be_invalid }
    end

    context 'When the publisher is nil' do
      let(:publisher) { nil }

      it { is_expected.to be_invalid }
    end

    context 'When the year is nil' do
      let(:year) { nil }

      it { is_expected.to be_invalid }
    end
  end
end
