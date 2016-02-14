require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  describe "#index" do
     it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    it "save successfully" do
      expect do
          post :create, question: {'question': 'Is this a pen?', 'answer': 'yes', 'quiz_type': 0}
        end.to change(Question, :count).by(1)
    end

    it "redirects to #index" do
      post :create, question: {'question': 'Is this a pen?', 'answer': 'yes', 'quiz_type': 0}
      expect(response).to redirect_to root_path
    end
  end

  describe "#answer" do
    it "redirects to #index when answer is correct" do
      question = create(:question)
      post :answer, id:question.id, answer: "yes"
      expect(response).to redirect_to root_path
    end

    it "renders show template when answer is wrong" do
      question = create(:question)
      post :answer, id:question.id, answer: "no"
      expect(response).to render_template("show")
    end
  end
end
