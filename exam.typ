// ============================================================
//  Klausurprotokoll – Stochastik
//  Hier oben die eigenen Daten eintragen:
// ============================================================
#let pruefer = "Prof. Dr. Reinhard Klein"
#let protokollant = "Christoph Derszteler"
#let modul = "Stochastik"
#let modulnummer = "BA-INF 128"
#let semester = "Sommersemester 2026"
#let periode = "1"
#let pruefungsdatum = "06.08.2026"
#let dauer = "90 Minuten"

// ---------------- Layout ----------------
#set page(
  paper: "a4",
  margin: (x: 2.4cm, top: 2.6cm, bottom: 2.2cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 8.5pt, fill: luma(90))
      #modul — Klausurprotokoll #semester
      #h(1fr) Seite #counter(page).display()
      #v(-6pt)
      #line(length: 100%, stroke: 0.4pt + luma(180))
    ]
  },
)
#set text(font: "Libertinus Serif", lang: "de", size: 10.5pt)
#set par(justify: true, leading: 0.65em)
#show link: set text(fill: blue.darken(20%))

#let pktbox(n) = box(
  fill: luma(240),
  stroke: 0.5pt + luma(160),
  inset: (x: 4pt, y: 2.5pt),
  radius: 2pt,
)[#text(size: 8.5pt)[#("/" + str(n))]]

#let aufgabe(nr, punkte, body) = {
  v(0.9em)
  block(
    width: 100%,
    fill: luma(232),
    inset: (x: 8pt, y: 6pt),
    radius: 3pt,
    sticky: true,
  )[#text(size: 12pt, weight: "bold")[Aufgabe #nr] #h(1fr) #text(size: 10pt, weight: "bold")[#punkte Punkte]]
  v(0.2em)
  body
}

#let teil(label, punkte, body) = block(width: 100%, above: 0.9em, below: 0.7em)[
  #grid(
    columns: (1.6em, 1fr, 2.6em),
    column-gutter: 0.4em,
    strong[(#label)],
    body,
    align(right + top, pktbox(punkte)),
  )
]

#let notiz(body) = block(
  width: 100%,
  fill: rgb("#fff8e1"),
  stroke: (left: 2pt + rgb("#e0a800")),
  inset: 7pt,
  radius: 2pt,
  above: 0.8em,
  below: 0.8em,
)[#text(size: 9pt)[*Anmerkung des Protokollanten:* #body]]

#let mc(..items) = block(above: 0.5em, below: 0.4em)[
  #for it in items.pos() [
    #box(baseline: 1pt, circle(radius: 2.6pt, stroke: 0.5pt))#h(0.5em)#it #linebreak()
  ]
]

// ---------------- Titel ----------------
#align(center)[
  #text(size: 9.5pt)[Rheinische Friedrich-Wilhelms-Universität Bonn #linebreak() Institut für Informatik]
  #v(0.6em)
  #text(size: 18pt, weight: "bold")[Klausurprotokoll]
  #v(0.2em)
  #text(size: 13pt)[#modul]
]

#v(0.8em)

#block(
  width: 100%,
  stroke: 0.6pt + luma(150),
  radius: 3pt,
  inset: 9pt,
)[
  #grid(
    columns: (auto, 1fr, auto, 1fr),
    row-gutter: 0.55em,
    column-gutter: 0.7em,
    [*Modul:*], [#modul], [*Modulnummer:*], [#modulnummer],
    [*Prüfer:*], [#pruefer], [*Semester:*], [#semester],
    [*Prüfungsperiode:*], [#periode], [*Prüfungsdatum:*], [#pruefungsdatum],
    [*Dauer:*], [#dauer], [*Protokollant:in:*], [#protokollant],
    [*Aufgabenzahl:*], [9], [*Gesamtpunktzahl:*], [70],
  )
]

#v(0.5em)

// ---------------- Punkteübersicht ----------------
#let punkteverteilung = ((1, 9), (2, 8), (3, 8), (4, 5), (5, 7), (6, 10), (7, 9), (8, 6), (9, 8))

#align(center)[
  #table(
    columns: (auto,) + (2.1em,) * punkteverteilung.len() + (2.6em,),
    rows: (auto, auto),
    align: center + horizon,
    stroke: 0.5pt + luma(150),
    inset: (x: 4pt, y: 4.5pt),
    table.header(
      text(size: 9pt)[*Aufgabe*],
      ..punkteverteilung.map(a => text(size: 9pt)[*#a.at(0)*]),
      text(size: 9pt)[*$Sigma$*],
    ),
    text(size: 9pt)[*Punkte*],
    ..punkteverteilung.map(a => text(size: 9pt)[#a.at(1)]),
    text(size: 9pt)[*#punkteverteilung.map(a => a.at(1)).sum()*],
  )
]

#v(0.5em)

#notiz[Die angegebenen *Teilpunktzahlen* innerhalb einer Aufgabe müssen nicht exakt denen der
Klausur entsprochen haben; sie entsprechen diesen aber grob. Die Gesamtpunktzahl je Aufgabe
ist verlässlich.]

// ============================================================
//  Inhalt
// ============================================================

#aufgabe(1, 9)[

  #teil("a", 3)[
    Wir interpretieren unterschiedliche Verteilungen durch Urnenexperimente. Welche Aussage ist
    *falsch*:
    #mc(
      [Die Multinomialverteilung modelliert eine Ziehung mit Zurücklegen.],
      [Die hypergeometrische Verteilung modelliert eine Ziehung mit Zurücklegen.],
      [Bei der Binomialverteilung wird die Reihenfolge der Ziehungen nicht berücksichtigt.],
      [Die geometrische Verteilung modelliert eine Ziehung mit Zurücklegen.],
    )
  ]

  #teil("b", 3)[
    Sei $(Omega, cal(A), P)$ ein Wahrscheinlichkeitsraum. Seien $A, B in cal(A)$ mit
    $A eq.not emptyset$ und sei $C subset.eq Omega$. Kreuzen Sie die Aussage an, die *falsch*
    sein kann.
    #mc(
      [$A union C in cal(A)$],
      [$A^C union B in cal(A)$ und $A inter B^C in cal(A)$],
      [$C^C union C in cal(A)$ und $C^C inter C in cal(A)$],
    )
  ]

  #teil("c", 3)[
    Sei $(Omega, cal(A), P)$ ein Wahrscheinlichkeitsraum. Seien $A, B in cal(A)$ mit
    $A eq.not emptyset$ und seien $A_1, A_2, dots$ eine Folge von Mengen in $cal(A)$. Kreuzen Sie
    die Aussage an, die *falsch* sein kann.
    #mc(
      [$P(union.big_(i=1)^oo A_i) >= sum_(i=1)^oo P(A_i)$],
      [$P(A union B) = P(A) + P(B) - P(A inter B)$],
      [Wenn $A subset.eq B$ gilt, gilt auch $P(A) <= P(B)$.],
    )
  ]
]

#aufgabe(2, 8)[
  Ein Tutorium besteht aus $n$ Studierende. Alle Studierende nehmen jeweils mit
  Wahrscheinlichkeit $p in [0,1]$ an dem Tutorium teil. Diese Wahrscheinlichkeit ist für alle
  Studierende gleich. Modellieren Sie die Anzahl der anwesenden Studenten mit einem
  Wahrscheinlichkeitsraum.

  #teil("a", 1)[Nennen Sie das passende Standardmodell beim Namen.]

  #teil("b", 2)[Geben Sie einen Wahrscheinlichkeitsraum $(Omega, cal(A), P)$ an.]

  #teil("c", 1)[
    Das Tutorium findet nur statt, wenn mehr als $k$ Studierende anwesend sind. Wie hoch ist die
    Wahrscheinlichkeit $hat(p)$, dass das Tutorium stattfindet?
  ]

  Wir betrachten nun mehrere Termine dieses Tutoriums. Sei $hat(p) in [0,1]$ die
  Wahrscheinlichkeit, dass das Tutorium zu einem gewissen Termin stattfindet. Diese
  Wahrscheinlichkeit ist für alle Termine gleich. Nach wie vielen stattgefundenen Tutorien fällt
  es das erste Mal aus? Modellieren Sie diese Frage mit einem Wahrscheinlichkeitsraum.

  #teil("d", 1)[Nennen Sie das passende Standardmodell beim Namen.]

  #teil("e", 2)[
    Geben Sie einen Wahrscheinlichkeitsraum $(hat(Omega), hat(cal(A)), hat(P))$ an, der dieses
    Zufallsexperiment modelliert.
  ]

  #teil("f", 1)[
    Berechnen Sie die Wahrscheinlichkeit für das Ereignis „das sechste oder siebte Tutorium fällt
    als Erstes aus“ in Abhängigkeit von $hat(p)$.
  ]
]

#aufgabe(3, 8)[
  Man kann die Zahlen $1, dots, 49$ eines Lottoscheins in die drei disjunkten Mengen
  #block(above: 0.6em, below: 0.6em)[
    #set list(tight: false, spacing: 0.6em)
    - $S_0 =$ „Zahlen, die weder durch 3 noch durch 7 teilbar sind“
    - $S_3 =$ „Zahlen, die durch 3, nicht aber durch 7 geteilt werden können“
    - $S_7 =$ „Zahlen, die durch 7 geteilt werden können“
  ]
  einteilen mit den Mächtigkeiten $|S_0| = 28$, $|S_3| = 14$ und $|S_7| = 7$. Nun werden
  gleichverteilt 6 unterschiedliche Felder markiert. Modellieren Sie die Wahrscheinlichkeit, dass
  genau $H_0$, $H_3$ und $H_7$ Felder in den jeweiligen Mengen markiert wurden.

  #teil("a", 2)[Nennen Sie das passende Standardmodell beim Namen.]

  #teil("b", 3)[
    Geben Sie einen Wahrscheinlichkeitsraum $(Omega, cal(A), P)$ an, der dieses Zufallsexperiment
    modelliert.
  ]

  #teil("c", 3)[
    Wie hoch ist die Wahrscheinlichkeit für das Ereignis $H_0 = 2$, $H_3 = 1$, $H_7 = 3$?
  ]
]

#aufgabe(4, 5)[
  Sei $P$ ein Wahrscheinlichkeitsmaß. Seien $a, b, c, d in RR$ und $X, Y$ Zufallsvariablen. Zeigen
  Sie die folgenden Eigenschaften:

  #teil("a", 2)[
    Verschiebungssatz: $bold("Cov")_P (X, Y) = bold(E)_P (X Y) - bold(E)_P (X) bold(E)_P (Y)$
  ]

  #teil("b", 3)[
    Spezielle Summenformel:
    $bold(V)_P (X + Y) = bold(V)_P (X) + bold(V)_P (Y) + 2 bold("Cov")_P (X, Y)$
  ]

  *Hinweis:* Benutzen Sie die Definition der Kovarianz und die Rechenregeln zum Erwartungswert.
]

#aufgabe(5, 7)[
  Sei $lambda > 0$, $Omega = ZZ_(>=0)$ und $cal(A) = 2^Omega$. Wir betrachten die Zähldichte der
  Poissonverteilung, das zugehörige Wahrscheinlichkeitsmaß und die Identität als Zufallsvariable:

  #align(center)[
    #grid(
      columns: 3,
      column-gutter: 2.2em,
      row-gutter: 1.0em,
      $P_lambda : ZZ_(>=0) -> [0,1]$,
      $P : cal(A) -> [0,1]$,
      $X : Omega -> Omega$,
      $k |-> display(e^(-lambda) dot lambda^k / k!)$,
      $A |-> display(sum_(omega in A) P_lambda (omega))$,
      $k |-> k$,
    )
  ]

  #v(0.4em)

  Zeigen Sie, dass die Poissonverteilung Erwartungswert und Varianz $lambda$ hat, d.h.
  $bold(E)_P (X) = bold(V)_P (X) = lambda$. #h(1fr) #pktbox(7)

  *Hinweis:* Sie dürfen die Reihendarstellung der Exponentialfunktion
  $e^x = sum_(k=0)^oo x^k / k!$ und ihrer Ableitung benutzen. Für die Varianz darf
  $bold(V)_P (X) = bold(E)_P (X^2) - bold(E)_P (X)^2$ ohne Beweis verwendet werden.
]

#aufgabe(6, 10)[
  Ein Wetterbericht für den kommenden Tag sagt zu 60 % eine Vorhersage für gutes Wetter (G) und zu
  40 % eine Vorhersage für schlechtes Wetter (S) vorher. Die Trefferquote, dass tatsächlich gutes
  Wetter (g) kommt, liegt bei 80 % und die Trefferquote, dass tatsächlich schlechtes Wetter (s)
  kommt, liegt bei 90 %. Vorhersagen bezeichnen wir also mit Großbuchstaben und das tatsächliche
  Wetter mit Kleinbuchstaben.

  #teil("a", 3)[
    Modellieren Sie dieses Experiment im Wegemodell. Geben Sie den zugrundeliegenden
    Wahrscheinlichkeitsraum $(Omega, cal(A), P)$ dabei explizit an. \
    *Hinweis:* Wegen Satz 5.6 aus der Vorlesung müssen Sie $P$ nicht als eine geschlossene Formel
    angeben. Es reicht alle notwendigen (bedingten) Wahrscheinlichkeiten anzugeben, um alle
    Ereignisse zu berechnen. Sie dürfen diese Wahrscheinlichkeiten auch als Graphen angeben.
  ]

  #teil("b", 3)[
    Wie hoch ist die Wahrscheinlichkeit, dass am nächsten Tag tatsächlich gutes Wetter ist?
  ]

  #teil("c", 4)[
    Angenommen morgen ist gutes Wetter. Mit welcher Wahrscheinlichkeit lautete die dazugehörige
    Wettervorhersage von heute „gut“?
  ]
]

#aufgabe(7, 9)[
  Sei $(Omega, cal(A), P)$ ein Wahrscheinlichkeitsraum, sei $n in NN$ und seien
  $X_1, dots, X_n : Omega -> RR$ paarweise unkorrelierte Zufallsvariablen. Sei $v > 0$ mit
  $bold(V)_P (X_i) <= v$ $forall i in {1, dots, n}$. Wir betrachten das arithmetische Mittel der
  Abweichungen vom Erwartungswert:

  $ Y_n = 1/n sum_(i=1)^n X_i - bold(E)_P (X_i) $

  #teil("a", 3)[
    Zeigen Sie, dass für die Varianz von $Y_n$ gilt:
    $ bold(V)_P (Y_n) <= v/n $
  ]

  #teil("b", 2)[
    Formulieren Sie das schwache Gesetz der großen Zahl inklusive seiner Voraussetzungen.
  ]

  #teil("c", 4)[
    Beweisen Sie das schwache Gesetz der großen Zahlen. \
    *Hinweis:* Die Tschebyscheff-Ungleichung darf ohne Beweis verwendet werden.
  ]
]

#aufgabe(8, 6)[
  Eine bestimmte Pflanzenart besitze die drei möglichen Blütenfarben rot (R), pink (P) und weiß
  (W). Bei der Kreuzung dieser Pflanzen mit einer pinkblühenden Blume entstehen in Abhängigkeit
  von den Blütenfarben der beiden beteiligten „Elternpflanzen“ folgende Farbanteile für die
  „Kinder“:

  #align(center)[
    #block(above: 0.8em, below: 0.8em)[
      #grid(
        columns: 4,
        column-gutter: 1.6em,
        row-gutter: 0.5em,
        align: (left, right, right, right),
        [Eltern R und P ergeben:], [50 % R], [50 % P], [0 % W],
        [Eltern P und P ergeben:], [25 % R], [50 % P], [25 % W],
        [Eltern W und P ergeben:], [0 % R], [50 % P], [50 % W],
      )
    ]
  ]

  In einem Feldversuch werden 4000 rotblühende, 4000 pinkblühende und 4000 weißblühende Pflanzen
  stets mit pinkblühenden Pflanzen gekreuzt und von jeder dieser 12000 Pflanzen im darauffolgenden
  Jahr je ein Samenkorn ausgesät. Mit den daraus entstehenden 12000 Blumen wird nun wieder durch
  Kreuzung mit pinkblühenden Pflanzen jeweils ein Samenkorn gewonnen, welches ein Jahr später
  erneut ausgesät wird usw.

  #teil("a", 2)[
    Veranschaulichen Sie die Übergänge der Blütenfarben von einer Generation zur nächsten durch
    einen Übergangsgraphen und stellen Sie eine passende Übergangsmatrix auf.
  ]

  #teil("b", 3)[Bestimmen Sie die Farbverteilung der 12000 Pflanzen nach einem Jahr.]

  #teil("c", 1)[
    Bestimmen Sie die Farbverteilung nach zwei Jahren. Was lässt sich hieraus über die
    langfristige Farbverteilung aussagen, wenn dieses Kreuzungsverfahren fortgeführt wird?
  ]
]

#aufgabe(9, 8)[
  Eine unfaire Münze wird $n = 1000$ mal geworfen. Sie zeigt dabei $k = 364$ mal Zahl. Wir möchten
  den Schätzer $p in Theta = [0,1]$, dass die Münze bei einmaligem Wurf Zahl zeigt so wählen, dass
  die Wahrscheinlichkeit des erhaltenen Ergebnisses maximal wird.

  #teil("a", 1)[Wie heißt diese statistische Methode?]

  #teil("b", 3)[
    Geben Sie dafür ein geeignetes statistisches Modell $(cal(X), cal(A), P_theta)$ basierend auf
    einer Binomialverteilung an.
  ]

  #teil("c", 4)[
    Leiten Sie eine Formel für den Schätzer $p$ her und geben Sie das Ergebnis für das angegebene
    Beispiel an.
  ]
]
