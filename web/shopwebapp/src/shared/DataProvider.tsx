import { createContext, PropsWithChildren, useEffect, useState } from "react";
import { Cart, User } from "../models";
import { getCart, getUserDetails } from "./api";

export const DataContext = createContext<{
  loading: boolean;
  cart?: Cart;
  user?: User;
}>({
  loading: false,
  cart: undefined,
  user: undefined,
});

export const DataProvider: React.FC<PropsWithChildren> = ({ children }) => {
  const [loading, setLoading] = useState<boolean>(false);
  const [cart, setCart] = useState<Cart>();
  const [user, setUser] = useState<User>();

  useEffect(() => {
    setLoading(true);
    Promise.all([getUserDetails(), getCart()]).then(([user, cart]) => {
      setUser(user);
      setCart(cart);
      setLoading(false);
      console.log("useEffect", user, cart);
    });
  }, []);

  return (
    <DataContext.Provider value={{ loading, cart, user }}>
      {children}
    </DataContext.Provider>
  );
};
