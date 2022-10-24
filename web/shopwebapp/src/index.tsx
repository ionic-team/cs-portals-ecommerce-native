import React from "react";
import { createRoot } from "react-dom/client";
import { getInitialContext } from "@ionic/portals";
import App, { AppContext } from "./App";

const defaultContext: AppContext = { startingRoute: "/" };

const context = getInitialContext<AppContext>()?.value ?? defaultContext;

const container = document.getElementById("root");
const root = createRoot(container!);
root.render(
  <React.StrictMode>
    <App context={context} />
  </React.StrictMode>
);
