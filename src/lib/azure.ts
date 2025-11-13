import { ConfidentialClientApplication, Configuration } from "@azure/msal-node";

let cca: ConfidentialClientApplication | null = null;

export function getMsalClient(): ConfidentialClientApplication {
  if (!process.env.CLIENT_ID || !process.env.CLIENT_SECRET) {
    throw new Error("CLIENT_ID and CLIENT_SECRET must be defined in .env");
  }

  if (!cca) {
    const config: Configuration = {
      auth: {
        clientId: process.env.CLIENT_ID,
        authority: "https://login.microsoftonline.com/organizations",
        clientSecret: process.env.CLIENT_SECRET,
      },
    };
    cca = new ConfidentialClientApplication(config);
  }
  return cca;
}
