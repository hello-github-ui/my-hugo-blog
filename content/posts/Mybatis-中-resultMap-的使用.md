---
title: Mybatis 中 resultMap 的使用
tags:
  - Java
categories:
  - 编程
draft: false
date: 2019-12-13 03:57:27
---

# Mybatis 中 resultMap 的使用

> 最关键的是明白 resultMap 的两个最重要的作用：
>
> *-1* ：当你在 select 中，`resultType`  是一个 Entity(或 Model等 pojo 时)，如果你的 sql 结果集字段与你的 `pojo` 属性名不一致时，这时可以通过 `resultMap` 起到 重新映射成你 `pojo` 中名字的结果集
>
> *-2* :  第二个作用应该是使用量最多的一种，就是涉及到多对一的结果集映射或者一对多的结果集映射时



##  先说一下 resultMap 中 的 association 和 collection 的区别

> `association` 用于 `一对一` 和 `多对一`的情况
>
> `collection` 用于 `一对一`  和 `一对多` 的情况



### 举例如下

```xml
<!--created by util.you.com@gmail.com search-->
    <select id="search" parameterType="java.util.Map" resultMap="reFundList">
        SELECT
            csr.id,
            csr.strategy_name,
            csr.remark,
            csr.`status`,
            sut.username,
            DATE_FORMAT(IFNULL(csr.insert_time, ''), '%Y-%m-%d %H:%i:%s') AS insert_time
        FROM
            `CL_STRATEGY_REFUND` AS csr
        LEFT JOIN
            `SYS_USER_TBL` AS sut ON sut.user_id = csr.insert_user_id
        WHERE
            csr.`status` = 1
        <if test="strategyName != null and strategyName != ''">
            AND csr.strategy_name LIKE CONCAT('%',#{strategyName}, '%')
        </if>
            ORDER BY csr.id DESC
        <if test="offset != null and limit != null">
            limit #{offset}, #{limit}
        </if>
        ;
    </select>

    <!--created by util.you.com@gmail.com search 因为这里返回类型(即封装类型)是 Map，所以 property 的值就是 Map 封装的 key 名称-->
    <resultMap id="reFundList" type="java.util.Map">
        <id column="id" property="id"/>
        <result column="strategy_name" property="strategyName"/>
        <result column="remark" property="remark"/>
        <result column="username" property="userName"/>
        <result column="insert_time" property="insertTime"/>
        <collection property="ruleList" javaType="ArrayList" column="id" select="selectReFundInfo"/>
    </resultMap>

    <!--created by util.you.com@gmail.com search-->
    <select id="selectReFundInfo" parameterType="java.lang.Integer" resultType="java.util.Map">
        select
            csrr.id,
            csrr.strategy_id,
            csrr.time_limit,
            csrr.fee_type,
            csrr.fee_value
        from
            `CL_STRATEGY_REFUND_REL` as csrr
        where
            csrr.`status` = 1 and csrr.strategy_id = #{id}
    </select>



```

* 注意点请看下图 *
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Mybatis-中-resultMap-的使用/1.png" style="border-radius: 10px;"/>
<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Mybatis-中-resultMap-的使用/2.png" style="border-radius: 10px;"/>



# 声明

> ***原创手敲不易，转载请注明出处，谢谢***。我是[拉丁小毛][3]，欢迎大家关注我哦，一起交流，共同进步。有问题可以`邮我哦(util.you.com@gmail.com)`


[1]: /img/bVbvoXw
[2]: /img/bVbvoXy
[3]: https://segmentfault.com/u/siben
  推荐一波我的新个人博客哦，欢迎大家访问哦[新个人博客哦](https://latinxiaomao.gitlab.io)

<img src="https://cdn.jsdelivr.net/gh/latin-xiao-mao/img/blog-content/Mybatis-中-resultMap-的使用/3.jpg" style="border-radius: 10px;"/>
