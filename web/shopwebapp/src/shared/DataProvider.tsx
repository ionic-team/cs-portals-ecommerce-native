import { createContext, PropsWithChildren, useEffect, useState } from "react";
import { Cart, User } from "../models";
import {
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
}>({
  cart: undefined,
  user: undefined,
  setUserDetails: () => {
    throw new Error("Method not implemented");
  },
  updateUserPicture: () => {
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

  const value = { cart, user, setUserDetails, updateUserPicture };
  return <DataContext.Provider value={value}>{children}</DataContext.Provider>;
};
