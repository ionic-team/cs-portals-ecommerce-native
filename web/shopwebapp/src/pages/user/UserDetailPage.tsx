import {
  IonButton,
  IonContent,
  IonHeader,
  IonIcon,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonListHeader,
  IonPage,
  IonTitle,
  IonToolbar,
  useIonModal,
  useIonRouter,
} from "@ionic/react";
import { add } from "ionicons/icons";
import { Camera, CameraDirection, CameraResultType } from "@capacitor/camera";
import { useForm, Controller } from "react-hook-form";
import { useData } from "../../shared/useData";
import { AddressItem, PaymentItem, ImageCropper } from "../../components";

import "./UserDetailPage.css";
import { useEffect, useState } from "react";

interface UserDetail {
  firstName: string;
  lastName: string;
  email: string;
}

const UserDetailPage: React.FC = () => {
  const [cameraImage, setCameraImage] = useState<string>("");
  const { user, setUserDetails, updateUserPicture } = useData();
  const router = useIonRouter();
  const { getValues, control, reset } = useForm<UserDetail>({
    mode: "onChange",
  });
  const [showCropModal, hideCropModal] = useIonModal(
    <ImageCropper
      image={cameraImage}
      onCropComplete={async (dataImageUrl: string) => {
        await updateUserPicture(dataImageUrl);
        setCameraImage("");
        hideCropModal();
      }}
      closeModal={() => hideCropModal()}
    />
  );

  useEffect(() => {
    if (user) {
      const { firstName, lastName, email } = user;
      reset({ firstName, lastName, email });
    }
  }, [user, reset]);

  const handlePictureClick = async () => {
    const image = await Camera.getPhoto({
      quality: 100,
      width: 300,
      direction: CameraDirection.Front,
      resultType: CameraResultType.Uri,
    });
    setCameraImage(image.webPath || "");
    showCropModal();
  };

  const updateUserData = async () => {
    const values = getValues();
    await setUserDetails({ ...user!, ...values });
  };

  return (
    <IonPage id="user-detail-page">
      <IonHeader translucent={true}>
        <IonToolbar>
          <IonTitle>Profile</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">Profile</IonTitle>
          </IonToolbar>
        </IonHeader>
        <div className="user-image" onClick={handlePictureClick}>
          <img src={user?.image} alt={`${user?.firstName} ${user?.lastName}`} />
          <IonIcon icon={add}></IonIcon>
        </div>
        <div className="user-info">
          <IonList lines="full">
            <IonItem>
              <IonLabel position="fixed" text-wrap>
                First Name
              </IonLabel>
              <Controller
                render={({ field: { onChange, value } }) => (
                  <IonInput
                    onBlur={() => updateUserData()}
                    onIonChange={(e) => onChange(e.detail.value!)}
                    value={value}
                  />
                )}
                control={control}
                name="firstName"
              />
            </IonItem>
            <IonItem>
              <IonLabel position="fixed" text-wrap>
                Last Name
              </IonLabel>
              <Controller
                render={({ field: { onChange, value } }) => (
                  <IonInput
                    onBlur={() => updateUserData()}
                    onIonChange={(e) => onChange(e.detail.value!)}
                    value={value}
                  />
                )}
                control={control}
                name="lastName"
              />
            </IonItem>
            <IonItem>
              <IonLabel position="fixed" text-wrap>
                Email Address
              </IonLabel>
              <Controller
                render={({ field: { onChange, value } }) => (
                  <IonInput
                    onBlur={() => updateUserData()}
                    onIonChange={(e) => onChange(e.detail.value!)}
                    value={value}
                    type="email"
                  />
                )}
                control={control}
                name="email"
              />
            </IonItem>
          </IonList>
        </div>
        <div className="list-section">
          <IonList lines="none">
            <IonListHeader>Addresses</IonListHeader>
            {user?.addresses.map((address) => (
              <AddressItem
                key={address.id}
                address={address}
                selectable={false}
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
        </div>
        <div className="list-section">
          <h4>Payment Methods</h4>
          <IonList lines="none">
            {user?.creditCards.map((creditCard) => (
              <PaymentItem
                key={creditCard.id}
                creditCard={creditCard}
                selectable={false}
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
        </div>
      </IonContent>
    </IonPage>
  );
};
export default UserDetailPage;
