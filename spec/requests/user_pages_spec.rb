require 'spec_helper'

describe "User pages" do

    subject { page }

    describe "index" do
        before do
            sign_in FactoryGirl.create(:user)
            FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
            FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
            visit users_path
        end

        it { should have_title('Competidores') }
        it { should have_content('Competidores') }

        describe "pagination" do
            before(:all) { 30.times { FactoryGirl.create(:user) } }
            after(:all)  { User.delete_all }

            it { should have_selector('div.pagination') }

            it "should list each user" do
                User.paginate(page: 1).each do |user|
                    expect(page).to have_selector('li', text: user.name)
                end
            end
        end

        it "should list each user" do
            User.all.each do |user|
                expect(page).to have_selector('li', text: user.name)
            end
       end
    end

    describe "profile page" do
        let(:user) { FactoryGirl.create(:user) }
        before { visit user_path(user) }

        it { should have_content(user.name) }
        it { should have_title(user.name) }
    end

    describe "signup page" do
        before { visit signup_path}

        it { should have_content('Crear mi cuenta')}
        it { should have_title(full_title('Crear mi cuenta'))}
    end

    describe "signup" do
        before { visit signup_path }

        let(:submit) { "Crear mi cuenta" }

        describe "with invalid information" do
            it "should not create a user" do
                expect { click_button submit }.not_to change(User, :count)
            end

            describe "after submission" do
                before { click_button submit }

                it { should have_title('Crear mi cuenta') }
                it { should have_content('error') }
            end
        end

        describe "with valid information" do
            before do
                fill_in "Nombre",         with: "Example User"
                fill_in "Email",        with: "user@example.com"
                fill_in "Contraseña",     with: "foobar"
                fill_in "Confirma Contraseña", with: "foobar"
            end

            it "should create a user" do
                expect { click_button submit }.to change(User, :count).by(1)
            end

            describe "after saving the user" do
                before { click_button submit }
                let(:user) { User.find_by(email: 'user@example.com') }

                it { should have_link('Salir') }
                it { should have_title(user.name) }
                it { should have_selector('div.alert.alert-success', text: 'Bienvenido') }

                describe "followed by signout" do
                    before { click_link "Salir" }
                    it { should have_link('Ingresar') }
                end                
            end
        end
    end

    describe "edit" do
        let(:user) { FactoryGirl.create(:user) }
        before do
            sign_in user
            visit edit_user_path(user)
        end

        describe "page" do
            it { should have_content("Actualiza datos del usuario") }
            it { should have_title("Modifica usuario") }
            it { should have_link('Cambiar', href: 'http://gravatar.com/emails') }
        end

        describe "with invalid information" do
            before { click_button "Guarda cambios" }

            it { should have_content('error') }
        end

        describe "with valid information" do
            let(:new_name)  { "New Name" }
            let(:new_email) { "new@example.com" }

            before do
                fill_in "Name",             with: new_name
                fill_in "Email",            with: new_email
                fill_in "Password",         with: user.password
                fill_in "Confirma Cotraseña", with: user.password
                click_button "Guarda cambios"
            end

            it { should have_title(new_name) }
            it { should have_selector('div.alert.alert-success') }
            it { should have_link('Salir', href: signout_path) }
            specify { expect(user.reload.name).to  eq new_name }
            specify { expect(user.reload.email).to eq new_email }
        end

    
    end
end

