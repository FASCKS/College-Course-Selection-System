import Global from '@/components/Global'
import request from '@/utils/request'

export const getTableList = (data ,url) => {
	// console.log(departId);
    return request({
	    url: Global.serverIp+url,
	    method: 'get',
	    params:data
    })
};

export const getNoParamList = (url) => {
	// console.log(departId);
    return request({
	    url: Global.serverIp+url,
	    method: 'get',
    })
};

export const postParam = (data ,url) => {
	// console.log(departId);
    return request({
	    url: Global.serverIp+url,
	    method: 'post',
	    params:data
    })
};

export const postJSONParam = (data ,url) => {
	// console.log(departId);
    return request({
	    url: Global.serverIp+url,
	    method: 'post',
	    data
    })
};
export const formJSONParam = (data ,url) => {
	// console.log(departId);
    return request({
	    url: Global.serverIp+url,
	    method: 'post',
	    headers:{
	        'content-type':"application/x-www-form-urlencoded"
	    },	   
	    params:data
    })
};
export const formDataParam = (data ,url) => {
	// console.log(departId);
    return request({
	    url: Global.serverIp+url,
	    method: 'post',
	    headers:{
	        'content-type':"application/x-www-form-urlencoded"
	    },	   
	    data
    })
};
export const getBlobData = (url) => {
    return request({
	    url: Global.serverIp+url,
	    method: 'get',
	    headers:{
	        'content-type':"application/vnd.ms-excel;charset=utf-8"
	    },	
	    responseType: 'blob',//告诉服务器我们需要的响应格式
    })
};