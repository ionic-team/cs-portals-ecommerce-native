import React from "react";
import { IonButton, IonContent, IonPage } from "@ionic/react";

const DebugPage: React.FC = () => (
  <IonPage>
    <IonContent>
      <IonButton expand="block" routerLink="/help">
        Help Portal
      </IonButton>
      <IonButton expand="block" routerLink="/user">
        Profile Portal
      </IonButton>
      <IonButton expand="block" routerLink="/checkout">
        Checkout Modal Portal
      </IonButton>
    </IonContent>
  </IonPage>
);

export default DebugPage;
