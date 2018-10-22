require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @title = "The Great Book #{rand(1000)}"
  end


  test "should get index" do
    get products_url, headers: @headers
    assert_response :success
    assert_select 'title', "Pragprog Books Online Store"
    assert_select 'h1', "Products"
  end

  test "should get new" do
    get new_product_url, headers: @headers
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } },
      headers: @headers
    end

    assert_redirected_to product_url(Product.last)
    assert_equal 'Product was successfully created.', flash[:notice]
  end

  test "should show product" do
    get product_url(@product), headers: @headers
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product), headers: @headers
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } },
    headers: @headers
    assert_redirected_to product_url(@product)
    assert_equal 'Product was successfully updated.', flash[:notice]
  end

  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
      delete product_url(products(:two)), headers: @headers
    end

    assert_redirected_to products_url
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product), headers: @headers
    end

    assert_redirected_to products_url
  end

  test "should require login" do
    logout
    get products_url
    follow_redirect!
    assert_select 'h2', "Please Log In"
  end
end
