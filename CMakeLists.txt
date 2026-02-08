cmake_minimum_required(VERSION 3.16)

project(cuteoksa VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(cuteoksa
    main.cpp
)

qt_add_qml_module(cuteoksa
    URI untitled1
    QML_FILES
        Main.qml
        RESOURCES images/esc.png
        RESOURCES images/esc_s.png
        RESOURCES images/esc_sf.png
        RESOURCES images/flag.png
        QML_FILES HeartImage.qml
        QML_FILES HeartPanel.qml
        QML_FILES HeartSmallPanel.qml
        QML_FILES HeartBackground.qml
        SOURCES
        SOURCES
        SOURCES scoremodel.h scoremodel.cpp
        QML_FILES Board.qml
        SOURCES scoreactor.h
        RESOURCES images/rus.png
        RESOURCES fonts/Manrope.ttf
        QML_FILES JuryPanel.qml
        QML_FILES Scoreboard.qml
        QML_FILES HeartSquareBackground.qml
        SOURCES scoreactor.cpp
        QML_FILES HeartSmallPanelOpt.qml
        RESOURCES images/w160/ad.png images/w160/ae.png images/w160/af.png images/w160/ag.png images/w160/ai.png images/w160/al.png images/w160/am.png images/w160/ao.png images/w160/aq.png images/w160/ar.png images/w160/as.png images/w160/at.png images/w160/au.png images/w160/aw.png images/w160/ax.png images/w160/az.png images/w160/ba.png images/w160/bb.png images/w160/bd.png images/w160/be.png images/w160/bf.png images/w160/bg.png images/w160/bh.png images/w160/bi.png images/w160/bj.png images/w160/bl.png images/w160/bm.png images/w160/bn.png images/w160/bo.png images/w160/bq.png images/w160/br.png images/w160/bs.png images/w160/bt.png images/w160/bv.png images/w160/bw.png images/w160/by.png images/w160/bz.png images/w160/ca.png images/w160/cc.png images/w160/cd.png images/w160/cf.png images/w160/cg.png images/w160/ch.png images/w160/ci.png images/w160/ck.png images/w160/cl.png images/w160/cm.png images/w160/cn.png images/w160/co.png images/w160/cr.png images/w160/cu.png images/w160/cv.png images/w160/cw.png images/w160/cx.png images/w160/cy.png images/w160/cz.png images/w160/de.png images/w160/dj.png images/w160/dk.png images/w160/dm.png images/w160/do.png images/w160/dz.png images/w160/ec.png images/w160/ee.png images/w160/eg.png images/w160/eh.png images/w160/er.png images/w160/es.png images/w160/et.png images/w160/fi.png images/w160/fj.png images/w160/fk.png images/w160/fm.png images/w160/fo.png images/w160/fr.png images/w160/ga.png images/w160/gb-eng.png images/w160/gb-nir.png images/w160/gb-sct.png images/w160/gb-wls.png images/w160/gb.png images/w160/gd.png images/w160/ge.png images/w160/gf.png images/w160/gg.png images/w160/gh.png images/w160/gi.png images/w160/gl.png images/w160/gm.png images/w160/gn.png images/w160/gp.png images/w160/gq.png images/w160/gr.png images/w160/gs.png images/w160/gt.png images/w160/gu.png images/w160/gw.png images/w160/gy.png images/w160/hk.png images/w160/hm.png images/w160/hn.png images/w160/hr.png images/w160/ht.png images/w160/hu.png images/w160/id.png images/w160/ie.png images/w160/il.png images/w160/im.png images/w160/in.png images/w160/io.png images/w160/iq.png images/w160/ir.png images/w160/is.png images/w160/it.png images/w160/je.png images/w160/jm.png images/w160/jo.png images/w160/jp.png images/w160/ke.png images/w160/kg.png images/w160/kh.png images/w160/ki.png images/w160/km.png images/w160/kn.png images/w160/kp.png images/w160/kr.png images/w160/kw.png images/w160/ky.png images/w160/kz.png images/w160/la.png images/w160/lb.png images/w160/lc.png images/w160/li.png images/w160/lk.png images/w160/lr.png images/w160/ls.png images/w160/lt.png images/w160/lu.png images/w160/lv.png images/w160/ly.png images/w160/ma.png images/w160/mc.png images/w160/md.png images/w160/me.png images/w160/mf.png images/w160/mg.png images/w160/mh.png images/w160/mk.png images/w160/ml.png images/w160/mm.png images/w160/mn.png images/w160/mo.png images/w160/mp.png images/w160/mq.png images/w160/mr.png images/w160/ms.png images/w160/mt.png images/w160/mu.png images/w160/mv.png images/w160/mw.png images/w160/mx.png images/w160/my.png images/w160/mz.png images/w160/na.png images/w160/nc.png images/w160/ne.png images/w160/nf.png images/w160/ng.png images/w160/ni.png images/w160/nl.png images/w160/no.png images/w160/np.png images/w160/nr.png images/w160/nu.png images/w160/nz.png images/w160/om.png images/w160/pa.png images/w160/pe.png images/w160/pf.png images/w160/pg.png images/w160/ph.png images/w160/pk.png images/w160/pl.png images/w160/pm.png images/w160/pn.png images/w160/pr.png images/w160/ps.png images/w160/pt.png images/w160/pw.png images/w160/py.png images/w160/qa.png images/w160/re.png images/w160/ro.png images/w160/rs.png images/w160/ru.png images/w160/rw.png images/w160/sa.png images/w160/sb.png images/w160/sc.png images/w160/sd.png images/w160/se.png images/w160/sg.png images/w160/sh.png images/w160/si.png images/w160/sj.png images/w160/sk.png images/w160/sl.png images/w160/sm.png images/w160/sn.png images/w160/so.png images/w160/sr.png images/w160/ss.png images/w160/st.png images/w160/sv.png images/w160/sx.png images/w160/sy.png images/w160/sz.png images/w160/tc.png images/w160/td.png images/w160/tf.png images/w160/tg.png images/w160/th.png images/w160/tj.png images/w160/tk.png images/w160/tl.png images/w160/tm.png images/w160/tn.png images/w160/to.png images/w160/tr.png images/w160/tt.png images/w160/tv.png images/w160/tw.png images/w160/tz.png images/w160/ua.png images/w160/ug.png images/w160/um.png images/w160/us.png images/w160/uy.png images/w160/uz.png images/w160/va.png images/w160/vc.png images/w160/ve.png images/w160/vg.png images/w160/vi.png images/w160/vn.png images/w160/vu.png images/w160/wf.png images/w160/ws.png images/w160/xk.png images/w160/ye.png images/w160/yt.png images/w160/za.png images/w160/zm.png images/w160/zw.png
        QML_FILES Wizard.qml
)

qt_add_resources(cuteoksa "res"
    PREFIX "/"
    FILES
        res/score.json
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(cuteoksa PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appuntitled1
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(cuteoksa
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS cuteoksa
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
