FactoryGirl.define do

  factory :nominal, class: Article do
    title "nominal test"
    abstract "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
  end

  factory :boundary_case_one_short, class: Article do
    title "inadequate"
    abstract "this abstract has has has nine words"
  end

  factory :boundary_case_one, class: Article do
    title "ten word abstract"
    abstract "one two three four five six seven eight nine ten"
  end

  factory :boundary_case_one_past, class: Article do
    title "eleven word abstract"
    abstract "one two three four five six seven eight nine ten eleven"
  end

end
