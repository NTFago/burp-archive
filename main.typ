#import "/facade.typ": *

#show: set-document-metadata.with(info: (
  author: "萧垣",
  title: "大邮逆向集",
  date: datetime.today(),
))

#include "cover.typ"


#show-foreword[
  = 前言

  《大邮逆向集》基于#link("https://github.com/ArtveFlinaInBupt/bupt")[大邮集集模板]进行编写于排版，旨在为网安专业学习*《汇编语言与逆向工程》*课程的同学提供解题参考。与其说它是一本习题册，它更像是一本答案书，主要记录的是往年期末考试的解题思路与方法。希望它能帮助同学们更好地理解课程内容，提升逆向工程能力。

  在这本习题册中，题干部分将会给出每道题的github链接，方便同学们下载题目进行练习；以及每道题解题过程中你需要知道的关键代码，以便跟上答案的思路。同时，希望同学们正确的使用此习题册，切勿直接抄袭答案，这对逆向的学习没有任何帮助。请先自己尝试解题，遇到困难时用做参考。

  编者水平有限，难免有疏漏之处，欢迎同学们在使用过程中发现任何问题（包括排版形式、错别字、公式错误、解题方法改进等），可以通过向#link("https://github.com/NTFago/burp-archive")[本项目]提交issue的方式进行反馈。希望大家能在学习中有所收获。

  #quote[如果你是因为在课程的竞赛系统上提交flag错误而来到这里：你可能会发现自己明明解出的flag是正确的，但系统却显示错误，不用担心，就是系统的问题，请寻求老师的帮助。]

  #h(1fr); #text(font: font.mono)[Xi4oYuaN]

  #divider()

  == 广告位

  天璇 Merak & 天枢 Dubhe 战队每年会组织招新赛，欢迎每位热爱CTF的同学加入战队，参与到CTF的学习与比赛中来。同时对于优秀的同学，可以直接以简历递交的方式加入战队，成为天璇 Merak & 天枢 Dubhe 战队的一员。战队每年都会组织参加国内外的CTF比赛，欢迎同学们加入战队，一起学习，一起成长。
]

#show-outline[
  #outline(
    target: heading,
    depth: 2,
  )
]

#show-body-start[
  #include "problemset/re.typ"
]