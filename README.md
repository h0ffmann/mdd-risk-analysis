<div align="center">

# mdd-risk-analysis

<sub>2017 · a course project at UFRJ · archived · <a href="https://h0ffmann.github.io/h0ffmann/">where the work is now</a> · <a href="#how-it-ran">how it ran</a> · <a href="#license">license</a></sub>

[![archived](https://img.shields.io/badge/archived-not%20maintained-6E7781?style=flat-square)](#archived)
[![since 2017](https://img.shields.io/badge/since-2017-1682D4?style=flat-square)](#what-it-is)
[![scala 2.11](https://img.shields.io/badge/scala-2.11-DC322F?style=flat-square&logo=scala&logoColor=white)](#what-is-in-it)
[![spark 2.1.0](https://img.shields.io/badge/spark-2.1.0-E25A1C?style=flat-square&logo=apachespark&logoColor=white)](#what-is-in-it)
[![license: Apache-2.0](https://img.shields.io/badge/license-Apache--2.0-1682D4?style=flat-square)](#license)

risk analysis of a price series with R, Scala and Apache Spark: the maximum drawdown (MDD) of a
stock. the first Scala i wrote.

</div>

## archived

> **this repository is archived and not maintained.** the work was done from april to june 2017.
> the last change, in november 2019, only deleted a file. nothing here was built or run again
> for this notice, so read the code as a record and not as a tool.

where the work is now:

| what | where |
|---|---|
| the whole story, with every work | [h0ffmann.github.io/h0ffmann](https://h0ffmann.github.io/h0ffmann/), where this repository is the mark "2017, the first scala" |
| the sea: forecasts and water quality for brazilian beaches, in Scala 3 | [marola.dev](https://marola.dev), [marola-dev/marola](https://github.com/marola-dev/marola), doi [10.5281/zenodo.23224155](https://doi.org/10.5281/zenodo.23224155) |
| a wave model on GPUs | [ww3-gpu](https://h0ffmann.github.io/ww3-gpu/), doi [10.5281/zenodo.23221351](https://doi.org/10.5281/zenodo.23221351) |
| a benchmark for forecasts of the brazilian coast | [marola-bench](https://github.com/marola-dev/marola-research/tree/main/marola-bench), doi [10.5281/zenodo.23352633](https://doi.org/10.5281/zenodo.23352633) |
| the tools that build the rest | [picasso](https://github.com/h0ffmann/picasso), doi [10.5281/zenodo.23311208](https://doi.org/10.5281/zenodo.23311208) |
| a book on closed source, with a note on this project | [closed source: the god that failed](https://h0ffmann.github.io/closed-source/), doi [10.5281/zenodo.23333656](https://doi.org/10.5281/zenodo.23333656); the note is [the first Scala](https://github.com/h0ffmann/closed-source/blob/main/notes/202610132352-the-first-scala-a-risk-project-at-ufrj.md) |
| the author | Matheus Hoffmann, [github.com/h0ffmann](https://github.com/h0ffmann), doi [10.5281/zenodo.23352630](https://doi.org/10.5281/zenodo.23352630) |

## what it is

the work of a university course at UFRJ, in the first half of 2017, by three students. its first
README had two lines, and they are kept here as they were:

> AR_mercado_financeiro
>
> Análise de risco no mercado financeiro

("risk analysis in the financial market".) the question was how deep a price can fall from its
last peak, the maximum drawdown, and how to measure that risk on a series of daily prices.

the analysis began in R. to run it on Apache Spark, a part of it was written again in Scala.
that is how i learned Scala, the language of my first job.

## what is in it

| folder | what | language |
|---|---|---|
| [`src/R-analysis/`](src/R-analysis/) | the analysis: path simulation (`Path_Simulation*.R`), a backtest of models (`backtest_models.R`), the drawdown (`MaximoDrawdrop.R`) | R |
| [`src/data/`](src/data/) | scripts that fetch a price series, and the series as CSV | R |
| [`src/mdd/`](src/mdd/) | `mddApp`: reads the CSV into a Spark DataFrame and prints three numbers from its functions `desvPadraoCalc`, `mddCalc` and `average` | Scala 2.11.7, Spark 2.1.0, sbt |
| [`src/var/`](src/var/) | `calcVar.scala`, a first example | Scala |
| [`app/`](app/) | a web page with a chart, and a server that starts the analysis through a shell script | Node.js, Express, Chart.js |
| [`doc/`](doc/) | the first and the final report of the course, in Portuguese, and a thesis that the work read | PDF |

## how it ran

as the project's own notes say ([`src/README.md`](src/README.md), [`src/mdd/README.md`](src/mdd/README.md),
both in Portuguese). **not run in 2026**: Scala 2.11 and Spark 2.1.0 are old, and no lock file
pins the rest.

```console
cd src/mdd
sbt package
spark-submit --class "mddApp" --master local[4] target/scala-2.11/simple-project_2.11-1.0.jar ../data/serieHistorica.csv
```

## what is not right in it

it is a student project of 2017 and it is left as it was. a reader should know:

- build outputs are committed (`src/mdd/project/target/`, `.class` files, an `.RData`).
- `package.json` still gives the address that the project had before it came to this account.
- `main.R` installs its packages each time it runs.
- there are no tests.
- `doc/Tese_IMPA_Maximo_Dropdown.pdf` is, by its name, a thesis from IMPA by another author.
  the licence of this repository does not cover it.

## people

three students made it. two of them are not named in this README; the history of the
repository shows who committed what.

## license

[Apache-2.0](LICENSE), for the code that the three students wrote. the thesis in `doc/` is its
author's.
