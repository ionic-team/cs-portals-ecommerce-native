import { Redirect, Route } from "react-router-dom";
import { IonApp, IonRouterOutlet, setupIonicReact } from "@ionic/react";
import { IonReactRouter } from "@ionic/react-router";
import { DataProvider } from "./shared/DataProvider";

import DebugPage from "./pages/debug/DebugPage";
import HelpPage from "./pages/help/HelpPage";
import UserDetailPage from "./pages/user/UserDetailPage";
import AddressPage from "./pages/address/AddressPage";
import PaymentPage from "./pages/payment/PaymentPage";
import CheckoutPage from "./pages/checkout/CheckoutPage";

/* Core CSS required for Ionic components to work properly */
import "@ionic/react/css/core.css";

/* Basic CSS for apps built with Ionic */
import "@ionic/react/css/normalize.css";
import "@ionic/react/css/structure.css";
import "@ionic/react/css/typography.css";

/* Optional CSS utils that can be commented out */
import "@ionic/react/css/padding.css";
import "@ionic/react/css/float-elements.css";
import "@ionic/react/css/text-alignment.css";
import "@ionic/react/css/text-transformation.css";
import "@ionic/react/css/flex-utils.css";
import "@ionic/react/css/display.css";

/* Theme variables */
import "./theme/variables.css";

setupIonicReact();

export interface AppContext {
  startingRoute: string;
}

const App: React.FC<{ context: AppContext }> = ({
  context: { startingRoute },
}) => (
  <DataProvider>
    <IonApp>
      <IonReactRouter>
        <IonRouterOutlet>
          <Route exact path="/">
            {startingRoute !== "/" ? (
              <Redirect to={startingRoute} />
            ) : (
              <DebugPage />
            )}
          </Route>
          <Route path="/address" exact component={AddressPage} />
          <Route path="/address/:id" exact component={AddressPage} />
          <Route path="/checkout" exact component={CheckoutPage} />
          <Route path="/help" exact component={HelpPage} />
          <Route path="/payment" exact component={PaymentPage} />
          <Route path="/payment/:id" component={PaymentPage} />
          <Route path="/user" exact component={UserDetailPage} />
        </IonRouterOutlet>
      </IonReactRouter>
    </IonApp>
  </DataProvider>
);

export default App;
