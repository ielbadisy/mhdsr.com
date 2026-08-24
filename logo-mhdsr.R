# install.packages("ggplot2")

library(ggplot2)

# -----------------------------
# Colors (same as biostatlab.org's logo-biostatlab.R, kept identical
# on purpose: MHDSR is the source biostatlab pipes its methods from)
# -----------------------------

navy   <- "#111827"
orange <- "#F97316"
blue   <- "#38BDF8"
text   <- "#E5E7EB"

# -----------------------------
# Hexagon coordinates
# -----------------------------

theta <- pi / 2 + seq(0, 2 * pi, length.out = 7)

hex <- data.frame(
  x = cos(theta),
  y = sin(theta)
)

# -----------------------------
# Logo
# -----------------------------

logo <- ggplot(hex, aes(x, y)) +
  geom_polygon(
    fill = navy,
    color = orange,
    linewidth = 2,
    linejoin = "mitre"
  ) +
  annotate(
    "text",
    x = 0,
    y = 0.06,
    label = "MHDSR |>",
    color = text,
    size = 12,
    family = "mono",
    fontface = "plain"
  ) +
  annotate(
    "text",
    x = 0.43,
    y = -0.66,
    label = "mhdsr.com",
    color = blue,
    size = 7,
    family = "mono",
    angle = 30
  ) +
  coord_equal(
    xlim = c(-1.12, 1.12),
    ylim = c(-1.08, 1.08),
    expand = FALSE
  ) +
  theme_void() +
  theme(
    plot.background = element_rect(fill = "transparent", color = NA),
    panel.background = element_rect(fill = "transparent", color = NA)
  )

# Display
print(logo)

# Save
ggsave(
  filename = "logo_mhdsr.png",
  plot = logo,
  width = 4,
  height = 4,
  dpi = 320,
  bg = "transparent"
)
