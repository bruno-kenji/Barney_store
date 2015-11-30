FactoryGirl.define do
  factory :product do
    sequence(:title) { |n| "Product #{n}" }
    description 'blablablabla'
    price 30.20
    image_url 'http://lorempixel.com/image_output/fashion-q-c-640-480-10.jpg'
  end
end