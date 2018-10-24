#---
# Excerpted from "Agile Web Development with Rails 5.1",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails51 for more book information.
#---
# encoding: utf-8
Product.find_or_create_by(title: 'Rails, Angular, Postgres, and Bootstrap',
  description:
    %{<p>
      <em>Powerful, Effective, and Efficient Full-Stack Web Development</em>
      As a Rails developer, you care about user experience and performance,
      but you also want simple and maintainable code. Achieve all that by
      embracing the full stack of web development, from styling with
      Bootstrap, building an interactive user interface with AngularJS, to
      storing data quickly and reliably in PostgreSQL. Take a holistic view of
      full-stack development to create usable, high-performing applications,
      and learn to use these technologies effectively in a Ruby on Rails
      environment.
      </p>},
  image_url: 'dcbang.jpg',    
  price_cents: 4500,
  locale: 'en')
# . . .
Product.find_or_create_by(title: 'Seven Mobile Apps in Seven Weeks',
  description:
    %{<p>
      <em>Native Apps, Multiple Platforms</em>
      Answer the question “Can we build this for ALL the devices?” with a
      resounding YES. This book will help you get there with a real-world
      introduction to seven platforms, whether you’re new to mobile or an
      experienced developer needing to expand your options. Plus, you’ll find
      out which cross-platform solution makes the most sense for your needs.
      </p>},
  image_url: '7apps.jpg',
  price_cents: 2600,
  locale: 'en')
# . . .

Product.find_or_create_by(title: 'Ruby Performance Optimization',
  description:
    %{<p>
      <em>Why Ruby Is Slow, and How to Fix It</em> 
      You don’t have to accept slow Ruby or Rails performance. In this
      comprehensive guide to Ruby optimization, you’ll learn how to write
      faster Ruby code—but that’s just the beginning. See exactly what makes
      Ruby and Rails code slow, and how to fix it. Alex Dymo will guide you
      through perils of memory and CPU optimization, profiling, measuring,
      performance testing, garbage collection, and tuning. You’ll find that
      all those “hard” things aren’t so difficult after all, and your code
      will run orders of magnitude faster.
      </p>},
  image_url: 'adrpo.jpg',
  price_cents: 4600,
  locale: 'en')

Product.find_or_create_by(title: 'Libro numero 1 en español',
  description:
    %{<p>
      Potente, eficaz y eficiente Desarrollo web de pila completa Como 
      desarrollador de Rails, le interesa la experiencia y el rendimiento 
      del usuario, pero también desea un código simple y fácil de mantener. 
      Obtenga todo esto al abarcar la pila completa de desarrollo web, desde 
      diseñar con Bootstrap, crear una interfaz de usuario interactiva con 
      AngularJS, hasta almacenar datos de manera rápida y confiable en PostgreSQL. 
      Obtenga una visión holística del desarrollo de pila completa para crear 
      aplicaciones utilizables y de alto rendimiento, y aprenda a usar estas 
      tecnologías de manera efectiva en un entorno Ruby on Rails.
      </p>},
  image_url: 'lorem.jpg',
  price_cents: 5500,
  locale: 'es')

Product.find_or_create_by(title: 'Libro de español 2',
  description:
    %{<p>
      Por qué Ruby es lento y cómo solucionarlo, no tiene que aceptar un rendimiento 
      lento de Ruby o Rails. En esta guía completa para la optimización de Ruby, 
      aprenderá a escribir código Ruby más rápido, pero eso es solo el comienzo. 
      Vea exactamente qué hace lento al código de Ruby y Rails, y cómo solucionarlo. 
      Alex Dymo lo guiará a través de los peligros de la memoria y la optimización 
      de la CPU, la generación de perfiles, la medición, las pruebas de rendimiento, 
      la recolección de basura y el ajuste. Encontrarás que todas esas cosas 
      "difíciles" no son tan difíciles después de todo, y tu código ejecutará órdenes 
      e magnitud más rápido.
      </p>},
  image_url: 'dcbang.jpg',
  price_cents: 88700,
  locale: 'es')

PayType.find_or_create_by(name: 'Check')
PayType.find_or_create_by(name: 'Credit Card')
PayType.find_or_create_by(name: 'Purchase Order')