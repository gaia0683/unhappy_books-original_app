FactoryBot.define do
  factory :user do
    name {'kimu'}
    nickname {'kk'}
    email {'kimu@kimu.com'}
    password {'gaia0683'}
    password_confirmation {'gaia0683'}
    admin {'true'}
  end
  factory :second_user, class: User do
    name {'bomu'}
    nickname {'kl'}
    email {'bomu@bomu.com'}
    password {'gaia0683'}
    password_confirmation {'gaia0683'}
    admin {'false'}
  end
end
