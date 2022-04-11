import * as React from "react";
import { FunctionComponent } from "react";
// @ts-ignore
import style from "./Loading.module.css";

interface IProps {}

const Loading: FunctionComponent<IProps> = ({}: IProps) => {
    return <div className={style.loading}>Loading...</div>;
};

export default Loading;
