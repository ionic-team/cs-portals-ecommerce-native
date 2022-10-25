import { createContext, PropsWithChildren, useEffect, useState } from "react";
import { Cart, CheckoutResult, User } from "../models";
import {
  checkoutResult,
  getCart,
  getUserDetails,
  setUserPicture,
  updateUserDetails,
} from "./api";

export const DataContext = createContext<{
  cart?: Cart;
  user?: User;
  setUserDetails: (user: User) => Promise<void>;
  updateUserPicture: (image: string) => Promise<void>;
  checkout: () => Promise<CheckoutResult>;
}>({
  cart: undefined,
  user: undefined,
  setUserDetails: () => {
    throw new Error("Method not implemented");
  },
  updateUserPicture: () => {
    throw new Error("Method not implemented");
  },
  checkout: () => {
    throw new Error("Method not implemented");
  },
});

export const DataProvider: React.FC<PropsWithChildren> = ({ children }) => {
  const [cart, setCart] = useState<Cart>();
  const [user, setUser] = useState<User>();

  useEffect(() => {
    Promise.all([getUserDetails(), getCart()]).then(([user, cart]) => {
      setUser(user);
      setCart(cart);
    });
  }, []);

  const setUserDetails = async (user: User) => {
    await updateUserDetails(user);
    setUser(user);
  };

  const updateUserPicture = async (image: string) => {
    await setUserPicture(image);
    setUser({ ...user!, image });
  };

  const checkout = async () => {
    await checkoutResult({ result: "success" });
    setCart({ id: user!.id, subTotal: 0.0, basket: [] });
    return { result: "success" } as CheckoutResult;
  };

  const value = { cart, user, setUserDetails, updateUserPicture, checkout };
  return <DataContext.Provider value={value}>{children}</DataContext.Provider>;
};
