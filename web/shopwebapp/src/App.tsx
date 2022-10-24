import { Redirect, Route } from "react-router-dom";
import { IonApp, IonRouterOutlet, setupIonicReact } from "@ionic/react";
import { IonReactRouter } from "@ionic/react-router";
import DebugPage from "./debug/DebugPage";
import HelpPage from "./help/HelpPage";

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
        <Route path="/address" exact component={DebugPage} />
        <Route path="/address/:id" exact component={DebugPage} />
        <Route path="/checkout" exact component={DebugPage} />
        <Route path="/help" exact component={HelpPage} />
        <Route path="/payment" exact component={DebugPage} />
        <Route path="/payment/:id" component={DebugPage} />
        <Route path="/user" exact component={DebugPage} />
      </IonRouterOutlet>
    </IonReactRouter>
  </IonApp>
);

export default App;
