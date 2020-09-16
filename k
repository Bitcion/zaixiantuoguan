port: 7890
socks-port: 7891
allow-lan: true
mode: Rule
log-level: info
external-controller: 127.0.0.1:9090
proxies:
  - {name: "🇭🇰 [vip2]香港04 HKBN-NETFLIX|HULU|HBO - 42036 单端口", server: vip2-hk4.mxssr.top, port: 42036, type: ssr, cipher: rc4-md5, password: TdHOEE, protocol: auth_aes128_sha1, obfs: plain, protocol-param: 5375:654321, obfs-param: ed2445375.microsoft.com, udp: true}
  - {name: "🇭🇰 V2RAY [vip1]广州移动-香港 Netflix 01", server: v109.mxv2ssr.xyz, port: 41109, type: vmess, uuid: e83d40a4-5ea7-314e-aa2c-4a921f8b431e, alterId: 2, cipher: auto, tls: false, skip-cert-verify: false, udp: true}
  - {name: "🇭🇰 [vip2]香港02 DMIT-NETFLIX|HULU|HBO - 42034 单端口", server: vip2-hk2.mxssr.top, port: 42034, type: ssr, cipher: rc4-md5, password: TdHOEE, protocol: auth_aes128_sha1, obfs: plain, protocol-param: 5375:654321, obfs-param: ed2445375.microsoft.com, udp: true}
  - {name: "🇭🇰 [vip2]香港03 DMIT-NETFLIX|HULU|HBO - 42035 单端口", server: vip2-hk3.mxssr.top, port: 42035, type: ssr, cipher: rc4-md5, password: TdHOEE, protocol: auth_aes128_sha1, obfs: plain, protocol-param: 5375:654321, obfs-param: ed2445375.microsoft.com, udp: true}
  - {name: "🇭🇰 [vip1]香港-新加坡 AGA 电信优化 01 ---有问题请加和电报群：https://t.me/joinchat/IQqEHFiHEmTpTvvs-w4Tcw - 39889 单端口", server: sgp1.mxssr.top, port: 39889, type: ssr, cipher: rc4-md5, password: TdHOEE, protocol: auth_aes128_sha1, obfs: plain, protocol-param: 5375:654321, obfs-param: ed2445375.microsoft.com, udp: true}
  - {name: "🇭🇰 [vip1]香港-日本 AGA 电信优化 03 - 39889 单端口", server: jp1.mxssr.top, port: 39889, type: ssr, cipher: rc4-md5, password: TdHOEE, protocol: auth_aes128_sha1, obfs: plain, protocol-param: 5375:654321, obfs-param: ed2445375.microsoft.com, udp: true}
  - {name: "🇭🇰 [vip1]香港01 NETFLIX - 39889 单端口", server: hk1.mxssr.top, port: 39889, type: ssr, cipher: rc4-md5, password: TdHOEE, protocol: auth_aes128_sha1, obfs: plain, protocol-param: 5375:654321, obfs-param: ed2445375.microsoft.com, udp: true}
  - {name: "🇭🇰 [vip1]香港02 - 41204 单端口", server: hk2.mxssr.top, port: 41204, type: ssr, cipher: rc4-md5, password: TdHOEE, protocol: auth_aes128_sha1, obfs: plain, protocol-param: 5375:654321, obfs-param: ed2445375.microsoft.com, udp: true}
  - {name: "🇭🇰 [vip1]香港03 - 41205 单端口", server: hk3.mxssr.top, port: 41205, type: ssr, cipher: rc4-md5, password: TdHOEE, protocol: auth_aes128_sha1, obfs: plain, protocol-param: 5375:654321, obfs-param: ed2445375.microsoft.com, udp: true}
  - {name: "🇭🇰 [vip1]香港-美国 AGA 电信优化 02 - 39889 单端口", server: us1.mxssr.top, port: 39889, type: ssr, cipher: rc4-md5, password: TdHOEE, protocol: auth_aes128_sha1, obfs: plain, protocol-param: 5375:654321, obfs-param: ed2445375.microsoft.com, udp: true}
  - {name: 不限流, server: 2607:9000:0:28::fb26:45e2, port: 1443, type: vmess, uuid: 23ad6b10-8d1a-40f7-8ad0-e3e35cd38297, alterId: 64, cipher: auto, tls: true, skip-cert-verify: false, network: ws, ws-path: /ws, ws-headers: {Host: s.liuboping.com}, udp: true}
  - {name: "🇭🇰 V2RAY [vip3]广州中转-香港 01", server: v348.mxv2ssr.xyz, port: 43348, type: vmess, uuid: e83d40a4-5ea7-314e-aa2c-4a921f8b431e, alterId: 2, cipher: auto, tls: false, skip-cert-verify: false, udp: true}
  - {name: "🇭🇰 V2RAY [vip3]广州中转-香港 02", server: v349.mxv2ssr.xyz, port: 43349, type: vmess, uuid: e83d40a4-5ea7-314e-aa2c-4a921f8b431e, alterId: 2, cipher: auto, tls: false, skip-cert-verify: false, udp: true}
  - {name: "🇸🇬 V2RAY [vip1]广州移动-新加坡 04", server: v112.mxv2ssr.xyz, port: 41112, type: vmess, uuid: e83d40a4-5ea7-314e-aa2c-4a921f8b431e, alterId: 2, cipher: auto, tls: false, skip-cert-verify: false, udp: true}
  - {name: "🇸🇬 V2RAY [vip1]广州移动-新加坡 05", server: v113.mxv2ssr.xyz, port: 41113, type: vmess, uuid: e83d40a4-5ea7-314e-aa2c-4a921f8b431e, alterId: 2, cipher: auto, tls: false, skip-cert-verify: false, udp: true}
  - {name: "🇯🇵 V2RAY [vip1]广州移动-日本 03", server: v111.mxv2ssr.xyz, port: 41111, type: vmess, uuid: e83d40a4-5ea7-314e-aa2c-4a921f8b431e, alterId: 2, cipher: auto, tls: false, skip-cert-verify: false, udp: true}
  - {name: "🇺🇲 V2RAY [vip1]广州移动-美国 06", server: v114.mxv2ssr.xyz, port: 41114, type: vmess, uuid: e83d40a4-5ea7-314e-aa2c-4a921f8b431e, alterId: 2, cipher: auto, tls: false, skip-cert-verify: false, udp: true}
  - {name: "🇭🇰 V2RAY [vip1]香港电信 02", server: v110.mxv2ssr.xyz, port: 41110, type: vmess, uuid: e83d40a4-5ea7-314e-aa2c-4a921f8b431e, alterId: 2, cipher: auto, tls: false, skip-cert-verify: false, udp: true}
  - {name: "🇯🇵 V2RAY [vip3]广州中转-日本 03", server: v350.mxv2ssr.xyz, port: 43350, type: vmess, uuid: e83d40a4-5ea7-314e-aa2c-4a921f8b431e, alterId: 2, cipher: auto, tls: false, skip-cert-verify: false, udp: true}
  - {name: "🇺🇲 V2RAY [vip3]广州中转-美国 04", server: v351.mxv2ssr.xyz, port: 43351, type: vmess, uuid: e83d40a4-5ea7-314e-aa2c-4a921f8b431e, alterId: 2, cipher: auto, tls: false, skip-cert-verify: false, udp: true}
proxy-groups:
  - name: 🚀 节点选择
    type: select
    proxies:
      - ♻️ 自动选择
      - 🔯 故障转移
      - 🔮 负载均衡
      - DIRECT
      - 🇭🇰 [vip2]香港04 HKBN-NETFLIX|HULU|HBO - 42036 单端口
      - 🇭🇰 V2RAY [vip1]广州移动-香港 Netflix 01
      - 🇭🇰 [vip2]香港02 DMIT-NETFLIX|HULU|HBO - 42034 单端口
      - 🇭🇰 [vip2]香港03 DMIT-NETFLIX|HULU|HBO - 42035 单端口
      - 🇭🇰 [vip1]香港-新加坡 AGA 电信优化 01 ---有问题请加和电报群：https://t.me/joinchat/IQqEHFiHEmTpTvvs-w4Tcw - 39889 单端口
      - 🇭🇰 [vip1]香港-日本 AGA 电信优化 03 - 39889 单端口
      - 🇭🇰 [vip1]香港01 NETFLIX - 39889 单端口
      - 🇭🇰 [vip1]香港02 - 41204 单端口
      - 🇭🇰 [vip1]香港03 - 41205 单端口
      - 🇭🇰 [vip1]香港-美国 AGA 电信优化 02 - 39889 单端口
      - 不限流
      - 🇭🇰 V2RAY [vip3]广州中转-香港 01
      - 🇭🇰 V2RAY [vip3]广州中转-香港 02
      - 🇸🇬 V2RAY [vip1]广州移动-新加坡 04
      - 🇸🇬 V2RAY [vip1]广州移动-新加坡 05
      - 🇯🇵 V2RAY [vip1]广州移动-日本 03
      - 🇺🇲 V2RAY [vip1]广州移动-美国 06
      - 🇭🇰 V2RAY [vip1]香港电信 02
      - 🇯🇵 V2RAY [vip3]广州中转-日本 03
      - 🇺🇲 V2RAY [vip3]广州中转-美国 04
  - name: ♻️ 自动选择
    type: url-test
    url: http://www.gstatic.com/generate_204
    interval: 300
    proxies:
 
      - 🇭🇰 V2RAY [vip1]广州移动-香港 Netflix 01
      

      - 🇸🇬 V2RAY [vip1]广州移动-新加坡 04
      - 🇸🇬 V2RAY [vip1]广州移动-新加坡 05
      - 🇯🇵 V2RAY [vip1]广州移动-日本 03
      - 🇺🇲 V2RAY [vip1]广州移动-美国 06
      - 🇭🇰 V2RAY [vip1]香港电信 02

  - name: 🔯 故障转移
    type: fallback
    url: http://www.gstatic.com/generate_204
    interval: 180
    proxies:
      - 🇭🇰 [vip2]香港04 HKBN-NETFLIX|HULU|HBO - 42036 单端口
      - 🇭🇰 V2RAY [vip1]广州移动-香港 Netflix 01
      - 🇭🇰 [vip2]香港02 DMIT-NETFLIX|HULU|HBO - 42034 单端口
      - 🇭🇰 [vip2]香港03 DMIT-NETFLIX|HULU|HBO - 42035 单端口
      - 🇭🇰 [vip1]香港-新加坡 AGA 电信优化 01 ---有问题请加和电报群：https://t.me/joinchat/IQqEHFiHEmTpTvvs-w4Tcw - 39889 单端口
      - 🇭🇰 [vip1]香港-日本 AGA 电信优化 03 - 39889 单端口
      - 🇭🇰 [vip1]香港01 NETFLIX - 39889 单端口
      - 🇭🇰 [vip1]香港02 - 41204 单端口
      - 🇭🇰 [vip1]香港03 - 41205 单端口
      - 🇭🇰 [vip1]香港-美国 AGA 电信优化 02 - 39889 单端口
      - 不限流
      - 🇭🇰 V2RAY [vip3]广州中转-香港 01
      - 🇭🇰 V2RAY [vip3]广州中转-香港 02
      - 🇸🇬 V2RAY [vip1]广州移动-新加坡 04
      - 🇸🇬 V2RAY [vip1]广州移动-新加坡 05
      - 🇯🇵 V2RAY [vip1]广州移动-日本 03
      - 🇺🇲 V2RAY [vip1]广州移动-美国 06
      - 🇭🇰 V2RAY [vip1]香港电信 02
      - 🇯🇵 V2RAY [vip3]广州中转-日本 03
      - 🇺🇲 V2RAY [vip3]广州中转-美国 04
  - name: 🔮 负载均衡
    type: load-balance
    url: http://www.gstatic.com/generate_204
    interval: 180
    proxies:
      - 🇭🇰 [vip2]香港04 HKBN-NETFLIX|HULU|HBO - 42036 单端口
      - 🇭🇰 V2RAY [vip1]广州移动-香港 Netflix 01
      - 🇭🇰 [vip2]香港02 DMIT-NETFLIX|HULU|HBO - 42034 单端口
      - 🇭🇰 [vip2]香港03 DMIT-NETFLIX|HULU|HBO - 42035 单端口
      - 🇭🇰 [vip1]香港-新加坡 AGA 电信优化 01 ---有问题请加和电报群：https://t.me/joinchat/IQqEHFiHEmTpTvvs-w4Tcw - 39889 单端口
      - 🇭🇰 [vip1]香港-日本 AGA 电信优化 03 - 39889 单端口
      - 🇭🇰 [vip1]香港01 NETFLIX - 39889 单端口
      - 🇭🇰 [vip1]香港02 - 41204 单端口
      - 🇭🇰 [vip1]香港03 - 41205 单端口
      - 🇭🇰 [vip1]香港-美国 AGA 电信优化 02 - 39889 单端口
      - 不限流
      - 🇭🇰 V2RAY [vip3]广州中转-香港 01
      - 🇭🇰 V2RAY [vip3]广州中转-香港 02
      - 🇸🇬 V2RAY [vip1]广州移动-新加坡 04
      - 🇸🇬 V2RAY [vip1]广州移动-新加坡 05
      - 🇯🇵 V2RAY [vip1]广州移动-日本 03
      - 🇺🇲 V2RAY [vip1]广州移动-美国 06
      - 🇭🇰 V2RAY [vip1]香港电信 02
      - 🇯🇵 V2RAY [vip3]广州中转-日本 03
      - 🇺🇲 V2RAY [vip3]广州中转-美国 04
  - name: 🎯 全球直连
    type: select
    proxies:
      - DIRECT
      - 🚀 节点选择
      - ♻️ 自动选择
  - name: 🛑 全球拦截
    type: select
    proxies:
      - REJECT
      - DIRECT
  - name: 🐟 漏网之鱼
    type: select
    proxies:
      - 🚀 节点选择
      - 🎯 全球直连
      - ♻️ 自动选择
      - 🔯 故障转移
      - 🔮 负载均衡
      - 🇭🇰 [vip2]香港04 HKBN-NETFLIX|HULU|HBO - 42036 单端口
      - 🇭🇰 V2RAY [vip1]广州移动-香港 Netflix 01
      - 🇭🇰 [vip2]香港02 DMIT-NETFLIX|HULU|HBO - 42034 单端口
      - 🇭🇰 [vip2]香港03 DMIT-NETFLIX|HULU|HBO - 42035 单端口
      - 🇭🇰 [vip1]香港-新加坡 AGA 电信优化 01 ---有问题请加和电报群：https://t.me/joinchat/IQqEHFiHEmTpTvvs-w4Tcw - 39889 单端口
      - 🇭🇰 [vip1]香港-日本 AGA 电信优化 03 - 39889 单端口
      - 🇭🇰 [vip1]香港01 NETFLIX - 39889 单端口
      - 🇭🇰 [vip1]香港02 - 41204 单端口
      - 🇭🇰 [vip1]香港03 - 41205 单端口
      - 🇭🇰 [vip1]香港-美国 AGA 电信优化 02 - 39889 单端口
      - 不限流
      - 🇭🇰 V2RAY [vip3]广州中转-香港 01
      - 🇭🇰 V2RAY [vip3]广州中转-香港 02
      - 🇸🇬 V2RAY [vip1]广州移动-新加坡 04
      - 🇸🇬 V2RAY [vip1]广州移动-新加坡 05
      - 🇯🇵 V2RAY [vip1]广州移动-日本 03
      - 🇺🇲 V2RAY [vip1]广州移动-美国 06
      - 🇭🇰 V2RAY [vip1]香港电信 02
      - 🇯🇵 V2RAY [vip3]广州中转-日本 03
      - 🇺🇲 V2RAY [vip3]广州中转-美国 04
