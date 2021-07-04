require 'rails_helper'

RSpec.describe EventPolicy do
  let(:user) { User.new(name: 'Event Owner') }
  let(:another_user) { User.new(name: 'Other User') }
  let(:event_wo_pincode) { Event.new(user: user) }
  let(:event_w_pincode) { Event.new(user: user, pincode: '123') }

  subject { described_class }

  describe 'unauthorized user' do
    let(:unauthorized_user) { UserContext.new(nil, {}) }

    permissions :create?, :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(unauthorized_user, Event) }
    end

    context 'when event with pincode' do
      permissions :show? do
        it { is_expected.not_to permit(unauthorized_user, event_w_pincode) }
      end
    end

    context 'when event without pincode' do
      permissions :show? do
        it { is_expected.to permit(unauthorized_user, event_wo_pincode) }
      end
    end
  end

  describe 'authorized event owner' do
    let(:event_user) { UserContext.new(user, nil) }

    permissions :create? do
      it { is_expected.to permit(event_user, Event) }
    end

    context 'when event with pincode' do
      permissions :show? do
        it { is_expected.to permit(event_user, event_w_pincode) }
      end

      permissions :edit?, :update?, :destroy? do
        it { is_expected.to permit(event_user, event_w_pincode) }
      end
    end

    context 'when event without pincode' do
      permissions :show? do
        it { is_expected.to permit(event_user, event_wo_pincode) }
      end

      permissions :edit?, :update?, :destroy? do
        it { is_expected.to permit(event_user, event_wo_pincode) }
      end
    end
  end

  describe 'authorized event owner' do
    let(:user_wo_event) { UserContext.new(another_user, { "#events_#{event_w_pincode.id}_pincode" => "123" }) }

    permissions :create? do
      it { is_expected.to permit(user_wo_event, Event) }
    end

    context 'when event with pincode' do
      permissions :show? do
        it { is_expected.to permit(user_wo_event, event_w_pincode) }
      end

      permissions :edit?, :update?, :destroy? do
        it { is_expected.not_to permit(user_wo_event, event_w_pincode) }
      end
    end

    context 'when event without pincode' do
      permissions :show? do
        it { is_expected.to permit(user_wo_event, event_wo_pincode) }
      end

      permissions :edit?, :update?, :destroy? do
        it { is_expected.not_to permit(user_wo_event, event_wo_pincode) }
      end
    end
  end
end
