module Admin
  describe UserPolicy do
    subject { UserPolicy }

    let (:user) { FactoryGirl.build_stubbed :user }
    let (:admin) { FactoryGirl.build_stubbed :user, :admin }

    permissions :index? do
      it "denies access if not an admin" do
        expect(subject).not_to permit(user)
      end
      it "allows access for an admin" do
        expect(subject).to permit(admin)
      end
    end

    permissions :show? do
      it "denies access if not an admin" do
        expect(subject).not_to permit(user)
      end
      it "allows an admin to see any profile" do
        expect(subject).to permit(admin, user)
      end
    end

    permissions :update? do
      it "prevents updates if not an admin" do
        expect(subject).not_to permit(user)
      end
      it "allows an admin to make updates to any user" do
        expect(subject).to permit(admin, user)
      end
    end

    permissions :destroy? do
      it "prevents deleting if not an admin" do
        expect(subject).not_to permit(user)
      end
      it "allows an admin to delete any user" do
        expect(subject).to permit(admin, user)
      end
    end

  end
end