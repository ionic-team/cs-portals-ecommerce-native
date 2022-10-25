import React, { useEffect, useState } from "react";
import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonItem,
  IonLabel,
  IonList,
  IonListHeader,
  IonPage,
  IonTitle,
  IonToolbar,
  useIonRouter,
} from "@ionic/react";
import Portals from "@ionic/portals";

import "./CheckoutPage.css";
import { AddressItem, PaymentItem } from "../../components";
import { Address, CheckoutResult, CreditCard } from "../../models";
import { useData } from "../../shared/useData";
import { Messages } from "../../shared/Messages";

const CheckoutPage: React.FC = () => {
  const { cart, user, checkout } = useData();
  const [selectedAddress, setSelectedAddress] = useState<Address>();
  const [selectedCard, setSelectedCard] = useState<CreditCard>();
  const router = useIonRouter();

  useEffect(() => {
    if (user) {
      const address = user.addresses.find((x) => x.preferred);
      address && setSelectedAddress(address);
      const card = user.creditCards.find((x) => x.preferred);
      card && setSelectedCard(card);
    }
  }, [user]);

  const handleDismiss = async () => {
    const data: CheckoutResult = { result: "cancel" };
    const message: Messages = { topic: "modal:dismiss", data };
    await Portals.publish<Messages>(message);
  };

  const handleOrder = async () => {
    const data = await checkout();
    await Portals.publish<Messages>({ topic: "modal:dismiss", data });
  };

  return (
    <IonPage id="checkout-page">
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonButton onClick={() => handleDismiss()}>Cancel</IonButton>
          </IonButtons>
          <IonTitle>Checkout</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent className="ion-padding">
        <IonList lines="none">
          <IonListHeader>Delivery</IonListHeader>
          {user?.addresses.map((address) => (
            <AddressItem
              key={address.id}
              address={address}
              onAddressSelected={(address) => setSelectedAddress(address)}
              selectedId={selectedAddress?.id}
              user={user}
            />
          ))}
        </IonList>
        <IonButton
          expand="block"
          color="secondary"
          onClick={() => router.push("/address")}
        >
          New Address
        </IonButton>
        <IonList lines="none">
          <IonListHeader>Payment</IonListHeader>
          {user?.creditCards.map((card) => (
            <PaymentItem
              key={card.id}
              creditCard={card}
              selectedId={selectedCard?.id}
              onPaymentSelected={(card) => setSelectedCard(card)}
              selectable={true}
            />
          ))}
        </IonList>
        <IonButton
          expand="block"
          color="secondary"
          onClick={() => router.push("/payment")}
        >
          New Payment Method
        </IonButton>
        <IonList lines="none">
          <IonListHeader>Review Total</IonListHeader>
          <IonItem>
            <IonLabel>${cart?.subTotal} + Tax</IonLabel>
          </IonItem>
        </IonList>
        <IonButton
          className="order-button"
          expand="block"
          onClick={() => handleOrder()}
        >
          Place Your Order
        </IonButton>
      </IonContent>
    </IonPage>
  );
};
export default CheckoutPage;
