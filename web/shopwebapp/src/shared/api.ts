import { CheckoutResult, User } from "../models";
import { ShopAPI } from "../plugins/shop-api";

export const getProductList = async () => {
  const res = require("../assets/data.json");
  const { products } = res;
  return products;
};

export const getUserDetails = async () => ShopAPI.getUserDetails();

export const updateUserDetails = async (user: User) =>
  ShopAPI.updateUserDetails(user);

export const getCart = async () => ShopAPI.getCart();

export const checkout = async (result: CheckoutResult) =>
  ShopAPI.checkoutResult(result);

export const getUserPicture = async () => {
  const { picture } = await ShopAPI.getUserPicture();
  return picture;
};

export const setUserPicture = async (picture: string) =>
  ShopAPI.setUserPicture({ picture });
