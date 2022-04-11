import * as React from "react";
import { FunctionComponent } from "react";
// @ts-ignore
import style from "./Footer.module.css";

const Footer: FunctionComponent = () => {
    return (
        <footer className={style.footer}>Made by Aleksandr Grigorenko</footer>
    );
};

export default Footer;
