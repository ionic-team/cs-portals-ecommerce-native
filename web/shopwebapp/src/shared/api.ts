import { CheckoutResult, User } from "../models";
import { ShopAPI } from "../plugins/shop-api";

export const getProductList = async () => {
  const res = require("../assets/data.json");
  const { products } = res;
  return products;
};

export const getUserDetails = async (): Promise<User> => {
  console.log("I AM GETTING USER DETAILS!");
  const user = await ShopAPI.getUserDetails();
  console.log("I GOT USER DETAILS", user);
  const { picture } = await ShopAPI.getUserPicture();
  return { ...user, image: picture };
};

export const updateUserDetails = async (user: User) =>
  ShopAPI.updateUserDetails(user);

export const getCart = async () => ShopAPI.getCart();

export const checkoutResult = async (result: CheckoutResult) =>
  ShopAPI.checkoutResult(result);

export const setUserPicture = async (picture: string) =>
  ShopAPI.setUserPicture({ picture });
