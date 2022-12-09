import { WebPlugin } from "@capacitor/core";
import { User, CheckoutResult, UserPicture, Cart } from "../../models";
import { ShopAPIPlugin } from "./definitions";

/**
 * This is an implementation that allows for usage when Capacitor
 * recognizes it is being run on the web platform.
 *
 * The following implementations are just mocks to enable web
 * developers to write their code outside of the native app.
 */

export class ShopAPIPluginWeb extends WebPlugin implements ShopAPIPlugin {
  async getCart(): Promise<Cart> {
    const res = require("../../assets/data.json");

    const { cart } = res;
    return cart;
  }

  async getUserDetails(): Promise<User> {
    const res = require("../../assets/data.json");
    const { user } = res;
    return user;
  }

  async updateUserDetails(user: User): Promise<void> {
    console.log("User update details", user);
  }

  async checkoutResult(result: CheckoutResult): Promise<void> {
    console.log("Checkout result", result);
  }

  async getUserPicture(): Promise<UserPicture> {
    return { picture: "jt-avatar" };
  }

  async setUserPicture(picture: UserPicture): Promise<void> {
    console.log("Image update details", picture);
  }
}
