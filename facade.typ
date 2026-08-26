#import "/bupt/common.typ" as bupt
#import "/bupt/model.typ": model-factory
#import "/bupt/util.typ": *
#import "/config.typ": *

// 把 config 绑定进 show 规则
#let set-document-metadata = bupt.set-document-metadata
#let indented-par        = bupt.indented-par.with(config)
#let show-foreword       = bupt.show-foreword.with(config)
#let show-outline        = bupt.show-outline.with(config)
#let show-body-start     = bupt.show-body-start.with(config)
#let show-body-file      = bupt.show-body-file.with(config)
#let show-appendix-start = bupt.show-appendix-start.with(config)
#let show-appendix-file  = bupt.show-appendix-file.with(config)
#let styled-raw = bupt.styled-raw.with(config)


// 工具函数
#let m = model-factory(config)
#let p  = m.p         // 单题
#let ps = m.ps        // 多问，小写编号 (1)(2)(3)…
#let pe = m.pe       
#let choices = m.choices
#let blank   = m.blank
#let marks   = m.marks
#let comment = m.comment
#let waring  = m.warning
#let error   = m.error
#let quote   = m.quote
#let tag     = m.tag
#let todo    = m.todo