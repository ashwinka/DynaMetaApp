package com.metadyna.module.repository;

import com.metadyna.module.model.MenuGroup;
import com.metadyna.module.model.ModuleEntry;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class ModuleRepository {

    // ── Menu Groups ───────────────────────────────────────────────────────────

    public List<MenuGroup> findAllMenuGroups(JdbcTemplate jdbc) {
        return jdbc.query(
                "SELECT ID, MENU_ID, LABEL, TRANSLATIONS, ICON, SEQUENCE, IS_ACTIVE FROM MENU_GROUPS ORDER BY SEQUENCE",
                (rs, n) -> MenuGroup.builder()
                        .id(rs.getString("ID"))
                        .menuId(rs.getString("MENU_ID"))
                        .label(rs.getString("LABEL"))
                        .translations(rs.getString("TRANSLATIONS"))
                        .icon(rs.getString("ICON"))
                        .sequence(rs.getInt("SEQUENCE"))
                        .isActive(rs.getString("IS_ACTIVE"))
                        .build());
    }

    // ── Modules ───────────────────────────────────────────────────────────────

    public List<ModuleEntry> findAllModules(JdbcTemplate jdbc) {
        return jdbc.query("""
                SELECT ID, MODULE_ID, ITEM_ID, LABEL, TRANSLATIONS, DESCRIPTION, MENU_GROUP_ID,
                       ICON, VIEW, DB_ROOT_TABLE, BADGE, BADGE_COLOR, IS_DISABLED, IS_ACTIVE, SEQUENCE
                  FROM MODULE ORDER BY SEQUENCE
                """, (rs, n) -> mapModule(rs));
    }

    // ── Helper ────────────────────────────────────────────────────────────────

    private ModuleEntry mapModule(java.sql.ResultSet rs) throws java.sql.SQLException {
        return ModuleEntry.builder()
                .id(rs.getString("ID"))
                .moduleId(rs.getString("MODULE_ID"))
                .itemId(rs.getString("ITEM_ID"))
                .label(rs.getString("LABEL"))
                .translations(rs.getString("TRANSLATIONS"))
                .description(rs.getString("DESCRIPTION"))
                .menuGroupId(rs.getString("MENU_GROUP_ID"))
                .icon(rs.getString("ICON"))
                .view(rs.getString("VIEW"))
                .dbRootTable(rs.getString("DB_ROOT_TABLE"))
                .badge(rs.getString("BADGE"))
                .badgeColor(rs.getString("BADGE_COLOR"))
                .isDisabled(rs.getString("IS_DISABLED"))
                .isActive(rs.getString("IS_ACTIVE"))
                .sequence(rs.getInt("SEQUENCE"))
                .build();
    }
}
