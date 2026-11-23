# Optional outside references for the Gap paragraph

The submitted proposal cites only the two DTU papers. Under the rubric, that
caps the Gap criterion at 3/4 ("a gap compared to methods from the course
material"). To aim for 4/4 ("illustrated with references to current papers or
industry experiences"), make the two changes below.

> **Check before using:** the three references below were written from memory
> and have not been checked against the papers. Confirm authors, venue, year
> and pages, and check that each one-line description matches what the paper
> actually does (e.g. via Google Scholar or the ACM/Springer pages). Drop any
> sentence you cannot confirm.

## 1. Replace the whole Gap paragraph in `main.tex`

This keeps the current Gap paragraph unchanged and adds two sentences on
outside work at the start. Replace everything from `\paragraph{Gap}` up to
(but not including) `\paragraph{Innovation}` with:

```latex
\paragraph{Gap}
Static analyzers have been tested by comparing several analyzers on the same
generated programs~\citep{klinger2019} and by running them on randomly
generated programs~\citep{cuoq2012}; metamorphic testing~\citep{chen2018}
offers a general way to check that a system gives consistent results on
equivalent inputs. These approaches compare \emph{different} analyzers or
generate \emph{new} programs, rather than asking whether \emph{one} analyzer
gives the same answer for equivalent versions of the same method.
Earlier DTU work applied semantics-preserving variations, such as renaming
variables and methods, to compare the robustness of an LLM and the Infer
analyzer in detecting null pointer exceptions, measuring results by reported
line numbers~\citep{chand2024}. The variations served as a robustness check
and were not placed using information about the program. Other work used
abstract interpretation to guide a fuzzer towards error-revealing inputs on
JPAMB~\citep{domingues2025}. However, a static analyzer's prediction for a
method does not depend on inputs; in JPAMB an analyzer receives only the
method. Input-level guidance therefore cannot reveal whether an analyzer
depends on how the code is written. That requires varying the program itself,
and it remains open where to vary it: rewriting at arbitrary sites may spend
effort on code whose analysis result cannot change.
```

Everything from `Earlier DTU work applied ...` onwards is identical to the
current `main.tex`; only the first two sentences are new.

## 2. Append to `bibfile.bib`

```bibtex
@inproceedings{klinger2019,
  author    = {Christian Klinger and Maria Christakis and Valentin W{\"u}stholz},
  title     = {Differentially Testing Soundness and Precision of Program Analyzers},
  booktitle = {Proceedings of the 28th ACM SIGSOFT International Symposium on Software Testing and Analysis (ISSTA)},
  pages     = {239--250},
  publisher = {ACM},
  year      = {2019}
}

@inproceedings{cuoq2012,
  author    = {Pascal Cuoq and Benjamin Monate and Anne Pacalet and Virgile Prevosto and John Regehr and Boris Yakobowski and Xuejun Yang},
  title     = {Testing Static Analyzers with Randomly Generated Programs},
  booktitle = {NASA Formal Methods (NFM)},
  series    = {Lecture Notes in Computer Science},
  volume    = {7226},
  pages     = {120--125},
  publisher = {Springer},
  year      = {2012}
}

@article{chen2018,
  author    = {Tsong Yueh Chen and Fei-Ching Kuo and Huai Liu and Pak-Lok Poon and Dave Towey and T. H. Tse and Zhi Quan Zhou},
  title     = {Metamorphic Testing: A Review of Challenges and Opportunities},
  journal   = {ACM Computing Surveys},
  volume    = {51},
  number    = {1},
  pages     = {4:1--4:27},
  year      = {2018}
}
```

## What each reference is used for (to verify)

| Key | Claimed in the paragraph | Difference from our project |
|---|---|---|
| `klinger2019` | Tests analyzers by comparing several analyzers on the same generated programs | Compares *across* analyzers; we compare *one* analyzer across equivalent versions of a method |
| `cuoq2012` | Tests static analyzers by running them on randomly generated programs | Generates new programs; we rewrite existing methods into equivalent versions |
| `chen2018` | Survey of metamorphic testing | The general technique we apply to analyzers |

These also make a natural starting point for the related-work section (PRW)
of the final paper.
