require 'test_helper'

class HousesControllerTest < ActionController::TestCase
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post :create, house: { active: @house.active, bath: @house.bath, city: @house.city, description: @house.description, drinking: @house.drinking, furnished: @house.furnished, gender: @house.gender, house_id: @house.house_id, laundry: @house.laundry, neighborhood: @house.neighborhood, num_of_bathrooms: @house.num_of_bathrooms, num_of_bedrooms: @house.num_of_bedrooms, parking: @house.parking, pets_allowed: @house.pets_allowed, price: @house.price, private_bath: @house.private_bath, private_room: @house.private_room, season: @house.season, smoking: @house.smoking, state: @house.state, street_1: @house.street_1, street_2: @house.street_2, type: @house.type, user_id: @house.user_id, utilities_included: @house.utilities_included, zip: @house.zip }
    end

    assert_redirected_to house_path(assigns(:house))
  end

  test "should show house" do
    get :show, id: @house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @house
    assert_response :success
  end

  test "should update house" do
    patch :update, id: @house, house: { active: @house.active, bath: @house.bath, city: @house.city, description: @house.description, drinking: @house.drinking, furnished: @house.furnished, gender: @house.gender, house_id: @house.house_id, laundry: @house.laundry, neighborhood: @house.neighborhood, num_of_bathrooms: @house.num_of_bathrooms, num_of_bedrooms: @house.num_of_bedrooms, parking: @house.parking, pets_allowed: @house.pets_allowed, price: @house.price, private_bath: @house.private_bath, private_room: @house.private_room, season: @house.season, smoking: @house.smoking, state: @house.state, street_1: @house.street_1, street_2: @house.street_2, type: @house.type, user_id: @house.user_id, utilities_included: @house.utilities_included, zip: @house.zip }
    assert_redirected_to house_path(assigns(:house))
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete :destroy, id: @house
    end

    assert_redirected_to houses_path
  end
end
