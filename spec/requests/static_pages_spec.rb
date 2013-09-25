require 'spec_helper'

describe "Static Pages" do

    subject { page }

    shared_examples_for "all static pages" do
        it { should have_selector('h1', text: heading) }
        it { should have_title(full_title(page_title)) }
    end
    
  describe "Home page" do
      before { visit root_path }
      let(:heading)    { 'Mi Quiniela' }
      let(:page_title) { '' }

      it_should_behave_like "all static pages"
      it { should_not have_title('| Inicio') }
    
  end

  describe "Help page" do
      before { visit help_path }
      let(:heading)    { 'Ayuda' }
      let(:page_title) { 'Ayuda' }

      it_should_behave_like "all static pages"
  end
  
  describe "About page" do
        before { visit about_path }
      let(:heading)    { 'Quienes somos' }
      let(:page_title) { 'Quienes somos' }

      it_should_behave_like "all static pages"
  end

  describe "Contact page" do
      before { visit contact_path }
      let(:heading)    { 'Contacto' }
      let(:page_title) { 'Contacto' }

      it_should_behave_like "all static pages"      
  end
end
