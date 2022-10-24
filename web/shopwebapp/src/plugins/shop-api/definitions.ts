import { Cart, CheckoutResult, User, UserPicture } from "../../models";

export interface ShopAPIPlugin {
  /** Get the current user's cart information. */
  getCart(): Promise<Cart>;

  /** Get profile information about the current user. */
  getUserDetails(): Promise<User>;

  /** Update the current user's profile information */
  updateUserDetails(user: User): Promise<void>;

  /** Obtain the result of a checkout operation. */
  checkoutResult(result: CheckoutResult): Promise<void>;

  /** Get the current user's profile picture. */
  getUserPicture(): Promise<UserPicture>;

  /** Set the current user's profile picture. */
  setUserPicture(picture: UserPicture): Promise<void>;
}
