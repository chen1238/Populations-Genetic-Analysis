#!/usr/bin/env python
import random
import argparse

parser = argparse.ArgumentParser(description='Random rows are taken from VCF files : python test.py --input 1.vcf --num 50 --output 2.vcf')
parser.add_argument("--input",type=str, required=True,metavar='',help="input vcf file")  #input file
parser.add_argument("--num",type=int, default=100,metavar='',help="the number of random rows, Required parameter") #random num
parser.add_argument("--output",type=str,required=True,metavar='',help='output vcf file') #output file
args = parser.parse_args()

random.seed(10)
with open(args.input,'r+',encoding='UTF-8') as a: #打开输入文件
    x=a.readlines() #读取文件为列表
    header_count=0  #判断header有几行
    for i in x:
        if '#' in i:
            header_count+=1
        else:
            break
    header=x[0:header_count] #得到header
    if args.num > (len(x)-header_count): #防止随机行参数太与vcf文件行数，超过范围
        print('ERROR: The number of random lines is greater than the range of VCF files')
        exit(0) #强制退出程序
        a.close()
    index=random.sample(list(range(header_count,len(x))),args.num) #随机取数字
    index.sort()
    for i in index:
        header.append(x[i]) #添加随机行数据
    with open(args.output,'w+',encoding='UTF-8') as b:#创建输出文件
        b.writelines(header) #输出
b.close() #关闭文件
a.close()
