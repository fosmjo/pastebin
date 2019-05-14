require 'rails_helper'

RSpec.describe PastesController, type: :controller do
  let(:paste) { FactoryBot.build(:paste) }

  context 'create' do
    it 'successfully' do
      post :create, params: { content: 'Hello, world!' }
      expect(response.status).to eq(200)
    end
  end

  context 'show' do
    it 'successfully' do
      paste.shortlink = Paste.gen_shortlink('127.0.0.1')
      paste.content = 'Hello, world!'
      paste.save!

      get :show, params: { shortlink: paste.shortlink }
      expect(response.body).to eq('Hello, world!')
    end
  end
end