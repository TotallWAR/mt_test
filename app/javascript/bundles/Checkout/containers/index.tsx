import * as React from "react";
import Layout from "../layouts/common/Layout";
import ItemsPicker from "../components/items-picker/ItemsPicker";
import BasketInfo from "../components/basket-info/BasketInfo";
import { ItemsProvider } from "../context/items.context";

// @ts-ignore
import style from "./container.module.css";
import "../../common/styles/index.css";

const CheckoutContainer = () => {
    return (
        <ItemsProvider>
            <Layout>
                <div className={style.container}>
                    <ItemsPicker />
                    <BasketInfo />
                </div>
            </Layout>
        </ItemsProvider>
    );
};

export default CheckoutContainer;
